puts "starting app..."

require 'bundler'

require 'active_support'
require 'active_support/core_ext'
require 'sinatra/reloader' #dev-only

puts "requiring gems..."

Bundler.require

Dotenv.load

$app_name   = 'mindy'

require './setup'
require './my_lib'

require_all './db'
require_all './admin'
require_all './bl'
require_all './comm'
require_all './logging'
require_all './mw'

include Helpers #makes helpers globally available 

get '/ping' do
  {msg: "pong from #{$app_name}", val: 'It is always now'}
end

post '/ping' do
  {msg: "post pong from #{$app_name}", val: 'It is always now'}
end

get '/' do
	redirect '/me' if cu
	erb :'home/home', default_layout
end

get '/logout' do
	session.clear 
	flash.message = 'Thanks, bye!'
	redirect '/'
end

post '/signup' do
	email = pr[:email]

	if user = $users.get(email: email)
		flash.message = 'Email already taken. Try to Login?'
		redirect back
	else
		data = {email: email, active: true}
		user = $users.add(data)
		session[:user_id] = user[:_id] 
		flash.message = 'Welcome.'
		redirect '/me'
	end
end

post '/login' do
	email = pr[:email]
	if user = $users.get(email: email)
		$users.update_id(user[:_id], {token: guid})
		flash.message = 'We sent you a magic login link to your email - click it to log in.'
		redirect back
	else
		flash.message = 'No such user. Try to sign up?'		
		redirect back
	end
end

get '/login' do
	erb :'home/login', default_layout
end

get '/email_login' do
	token = pr[:token]

	if user = $users.get(token: token) 
		session[:user_id] = user[:_id]
		flash.message = "Welcome, #{user[:email]}"
		redirect '/'
	else
		flash.message = 'Token expired, please try again.'
		redirect '/login'
	end
end

def sella
	$users.get(email: 'sella.rafaeli@gmail.com')
end