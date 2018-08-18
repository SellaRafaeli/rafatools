require './app'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

def is_good_time
  t = Time.now
  sf_hour = (t.hour - 7) # time is GMT, -7 for SF 
  # return false if sf_hour > 17 || sf_hour < 9 
  # return false if t.sunday?    || t.saturday? 
  true
end

def send_message
  bp
  msg = build_msg
  twilio_send msg 
end

scheduler.every '10s' do
  send_message
end

puts "Mindy Scheduler is now running."
scheduler.join
# EVERY_DAY_AT_5_AM                = '0 5 * * *' #time is GMT
# EVERY_DAY_AT_5_MIN_PAST_EIGHT_PM = '5 20 * * *'
# EVERY_DAY_AT_30_MIN_PAST_TEN_PM  = '30 22 * * *'
# EVERY_DAY_AT_1900                = '0 19 * * *'
# EVERY_MONDAY_AT_NOON             = '00 10 * * mon'

# (see "man 5 crontab" in your terminal)