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

def all_users
  [{name: 'sella', gmt_offset: -7, phone: '+14157173226'}]
   #{name: 'liliya', gmt_offset: +3, phone: '+972549135125', max_hour: 21, extra_msgs: true}]
end

def is_good_time(user)
  t          = Time.now
  offset     = user[:gmt_offset]
  local_hour = (t.hour + offset) # time is GMT, -7 for SF 
  too_early  = local_hour < 9
  too_late   = local_hour > (user[:max_hour] || 22)  
  return false if too_early || too_late
  # return false if t.sunday?    || t.saturday? 
  true
end

def send_user_msg(u)
  if is_good_time(u)
    msg = build_msg(u)
    twilio_send(msg,u[:phone])
  end
end

def send_all_users
  all_users.each {|u| send_user_msg(u) }
end