START_HOUR = 10
END_HOUR   = 22

def extra_msg
  # [MSGS_RON, MSGS_INSPIRATION, MSGS_ENTREP].sample.sample.squish
  [MSGS_RON].sample.sample.squish
end

def build_msg(user = all_users.first)
  return extra_msg if user[:extra_msgs] && prob(0.25)

  prefix = prob(0.25) ? get_msg_prefix : ''
  body   = get_msg_body(user)
  emoji  = prob(0.25) ? get_msg_emoji : ''

  msg    = prefix + " " + body + " " + emoji
  msg    = clean_phrase(msg)
end

def is_good_time(user)
  t          = Time.now
  offset     = user[:gmt_offset].to_f || -7
  local_hour = (t.hour + offset) # time is GMT, -7 for SF 
  too_early  = local_hour < START_HOUR #10
  too_late   = local_hour > END_HOUR #(user[:max_hour] || 22)  
  return false if too_early || too_late
  # return false if t.sunday?    || t.saturday? 
  true
end

def send_user_msg(u)
  if is_good_time(u)
    msg = build_msg(u)
    twilio_send(msg,u[:num])
  else 
    'skipping, not good time'
  end
end