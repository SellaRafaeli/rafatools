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
	erb :'home/home', default_layout
end

get '/signup' do
	num = pr[:num]
	if user = $users.get(num: num)
		session[:user_id] = user[:_id] 
	else
		user = $users.add(num: num)
		session[:user_id] = user[:_id] 
	end

	redirect '/me'
end

get '/me' do
	redirect '/' unless cu
	erb :'me/me', default_layout
end