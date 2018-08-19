def build_msg
  prefix = prob(0.25) ? get_msg_prefix : ''
  body   = get_msg_body
  emoji  = prob(0.25) ? get_msg_emoji : ''

  msg    = prefix + " " + body + " " + emoji
  msg    = clean_phrase(msg)
end

def is_good_time
  t = Time.now
  sf_hour = (t.hour - 7) # time is GMT, -7 for SF 
  return false if sf_hour > 17 || sf_hour < 9 
  # return false if t.sunday?    || t.saturday? 
  true
end

def send_message
  msg = build_msg
  if is_good_time
    twilio_send msg 
  end
end