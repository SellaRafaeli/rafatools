$feedback = $mongo.collection('feedback')

post '/feedback' do
	$feedback.add(pr)
	flash.message = "Thanks!"
	redirect '/'
end