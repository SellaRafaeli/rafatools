$stripe_notifs = $mongo.collection('stripe_notifs')

SUCCESS_STRIPE_NOTIFS_TYPES = ["checkout.session.completed", "customer.subscription.created"]
post '/stripe_notif' do
	$stripe_notifs.add(pr)

	begin
		type    = pr[:type]
		user_id = pr[:data]['object']['client_reference_id']
		if user_id && type.in? SUCCESS_STRIPE_NOTIFS_TYPES
			$users.update_id(user_id, {paid: Time.now}) rescue nil
		end
	rescue => e
		log_e(e)
	end
	
	{msg: 'ok'}	
end