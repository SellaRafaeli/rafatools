$stripe_notifs = $mongo.collection('stripe_notifs')

post '/stripe_notif' do
	$stripe_notifs.add(pr)

	# "checkout.session.completed" means success?
	# see https://stripe.com/docs/payments/checkout/fulfillment#webhooks

	begin
		user_id = pr[:data]['object']['client_reference_id']
		if user_id 
			$users.update_id(user_id, {paid: Time.now}) rescue nil
		end
	rescue => e
		puts e
	end
	
	{msg: 'ok'}	
end