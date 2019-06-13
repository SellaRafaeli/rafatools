$sent_messages = $mongo.collection('sent_messages')

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

def user_exceeded_daily_limit(user)
  num_msgs_in_last_twelve_hours = $sent_messages.count(email: user[:email], created_at: {'$gt': Time.now - 12.hours}) 
  limit = user[:num_msgs_per_day].to_i
  limit = 1 if limit < 1
  limit = 4 if limit > 4
  return num_msgs_in_last_twelve_hours >= limit 
end

def is_good_time(user)
  return false if user_exceeded_daily_limit(user)
  t          = Time.now
  offset     = user[:gmt_offset].to_f || -7
  local_hour = (t.hour + offset) % 24 # time is GMT, -7 for SF 
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
    $sent_messages.add(user_id: u[:_id], email: u[:email], msg: msg)
  else 
    $sent_messages.add(user_id: u[:_id], email: u[:email], skipped: true)
  end
end