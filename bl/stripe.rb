$stripe_notifs = $mongo.collection('stripe_notifs')

post '/stripe_notif' do
	$stripe_notifs.add(pr)
	{msg: 'ok'}	
end