def build_msg(user = all_users.first)
  prefix = prob(0.25) ? get_msg_prefix : ''
  body   = get_msg_body(user)
  emoji  = prob(0.25) ? get_msg_emoji : ''

  msg    = prefix + " " + body + " " + emoji
  msg    = clean_phrase(msg)
end

def all_users
  [{name: 'sella', gmt_offset: -7, phone: '+972522934321'},
    {name: 'liliya', gmt_offset: +3, phone: '+972549135125'}]
end

def is_good_time(user)
  t          = Time.now
  offset     = user[:gmt_offset]
  local_hour = (t.hour + offset) # time is GMT, -7 for SF 
  return false if local_hour > 17 || local_hour < 9 
  # return false if t.sunday?    || t.saturday? 
  true
end

def send_user_msg(u)
  if is_good_time(u)
    msg = build_msg(u)
    twilio_send(msg,u)
  end
end

def send_all_users
  all_users.each {|u| send_user_msg(u) }
end