$users = $mongo.collection('users')

get '/me' do
	redirect_unless_user
	erb :'me/me', default_layout
end

post '/me' do
	redirect_unless_user
	country_code = pr[:countryCode].to_s
	num          = country_code + pr[:num].to_s
	num_msgs_per_day = pr[:num_msgs_per_day].to_i
	num_msgs_per_day = 1 if num_msgs_per_day < 1
	num_msgs_per_day = 4 if num_msgs_per_day > 4
	gmt_offset   = 0 #default, PST
	
	if country_code == '972'
		gmt_offset = 3
	elsif country_code == '1'
		gmt_offset = -7		
	end

	$users.update_id(cu['_id'],{gmt_offset: pr[:gmt_offset], active: !!pr[:active], num: num, country_code: country_code, num_msgs_per_day: num_msgs_per_day})
	flash.message = 'Updated settings.'
	redirect '/me'
end