def get_core_prefix
  prefix = ['hey','hey there','hi','hi there','hello','hello there','quick reminder -','yo,','reminding you that','just wanted to remind you','just wanted to tell you','reminder -','hey, what\'s up?','how\'s it going?','how are you?','what\'s going on?'].sample
end

def get_msg_prefix
  prefix = get_core_prefix  
  breaks = [',','-','- ','!','.',';','?']
  prefix+=',' if !(breaks.any? {|d| prefix.ends_with? d})
  prefix
end

def get_msg_body
  [
      'You are doing great',
      'Keep up the good work',
      "You've done this a thousand times before - you can do it now.",
      'You are awesome.',
      'Believe in yourself! :)',
      "Things take time. Take it easy.",
      "Take a moment to relax and enjoy life ;)",
      "Life's too short to stress :)",
      "You can't solve stress with more stress.",
      "Take a breath and relax :)",
      "Be mindful and enjoy what is happening around you.",
      "Stop worrying :) Everything will work out. Everything has always worked out until now, and everything will keep working out :)",
      "Everybody dies in the end - you might as well enjoy the ride :)",
      "You are loved and appreciated. :)",
      "Everything takes time and so will this. Relax - things take time. You're going to master this.",
      "Judge yourself positively.",
      "Be proud of yourself!",
      "If you're struggling with anything, give it at least a few days to see if you can't figure it out.",
      "Everything is Sababa",
      "Relax. Just relax. :)",
      "You're the man",
      "Remember that stress is the biggest problem in life. Chillax ;)",
      "Take a break and refresh yourself ;)",
      "Everything's going to be just fine.",
      "If you're stressed by whatever it is - then it ain't worth it :)",
      "Remember to take time off to refresh your mind.",
      "Today is a great day and you are doing great.",
      "remind yourself of three things you are thankful for",
      "Life is now. Don't stress about it.",
      "Life's short - make sure you enjoy it",
      "Today is an awesome day!",
      "Life is awesome",
      "We are always stressed. Remember to work out your 'relaxation' muscle ;)",
      "Don't worry! Be happy ;)",
      "There's no time to relax like the present",
      "Will you look back in 5 years and remember this day fondly?",
      "Smile! It will make you feel better",
      "Stop worrying. You are doing fine.",
  ].sample
end



def get_msg_emoji 
  ["😀", "😁", "😂", "😃", "😄", "😅", "😆", "😉", "😊", "😋", "😎", "😍", "😘", "😚", "😌", "😛", "😜", "😝", "😇", "😸", "😹", "😻", "😼", "😽", "👼", "💪", "👌", "👍", "✊", "👏"].sample
end

