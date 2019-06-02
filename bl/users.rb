$users = $mongo.collection('users')

get '/me' do
	redirect_unless_user
	erb :'me/me', default_layout
end

post '/me' do
	redirect_unless_user
	$users.update_id(cu['_id'],{gmt_offset: pr[:gmt_offset], active: !!pr[:active], num: pr[:num]})
	flash.message = 'Updated settings.'
	redirect '/me'
end