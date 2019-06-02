def twilio_send(msg, to_num)
  account_sid = ENV['TWILIO_ACCOUNT']
  auth_token = ENV['TWILIO_TOKEN']
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+14153267892' # Your Twilio number
  to = to_num

  puts "sending twilio message #{from} to #{to}, body #{msg}"
  if $prod
    return client.messages.create(from: from, to: to, body: msg)
  else 
    return "<skipping actual SMS since not prod>"
  end
end