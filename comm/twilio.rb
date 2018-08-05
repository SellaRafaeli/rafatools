def twilio_send(msg)
  account_sid = ENV['TWILIO_ACCOUNT']
  auth_token = ENV['TWILIO_TOKEN']
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+14153267892' # Your Twilio number
  to = '+972522934321' # Your mobile phone number

  puts "sending twilio message #{from} to #{to}, body #{msg}"
  if $prod
    client.messages.create(from: from, to: to, body: msg)
  else 
    puts "<skipping actual SMS since not prod>"
  end
end