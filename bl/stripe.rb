$strip_notifs = $mongo.collection('stripe_notifs')

post '/stripe_notif' do
	$strip_notifs.add(pr)
	{msg: 'ok'}	
end