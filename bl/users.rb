$users = $mongo.collection('users')

get '/me' do
	redirect_unless_user
	erb :'me/me', default_layout
end

post '/me' do
	redirect_unless_user
	country_code = pr[:countryCode].to_s
	num          = country_code + pr[:num].to_s
	gmt_offset   = 0 #default, PST
	
	if country_code == '972'
		gmt_offset = 3
	elsif country_code == '1'
		gmt_offset = -7		
	end

	$users.update_id(cu['_id'],{gmt_offset: pr[:gmt_offset], active: !!pr[:active], num: num, country_code: country_code})
	flash.message = 'Updated settings.'
	redirect '/me'
end