$requests = $mongo.collection('requests') #track http requests

def log_request(data)
  data = data.just(:time_took)
  data = data.merge({user_id: cuid, path: request_path, params: _params})
  $requests.add(data)
end

get '/refresh' do
	true
end