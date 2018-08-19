def get_core_prefix
  prefix = ['hey','hey there','hi','hi there','hello there','quick reminder -','yo,','reminding you that','just wanted to remind you','just wanted to tell you','reminder -','hey, what\'s up?','how\'s it going?','how are you?','what\'s going on?',
    "hey it's me",
    "hey it's me again",
    "chiming in,",
    "ping!",
    "checking in,",
    "quick ping,",
    "a tiny reminder",
    "a brief thought",
    "this just in",
    "random reminder:",
    "don't forget:",
    ].sample
end

def get_msg_prefix
  prefix = get_core_prefix  
  breaks = [',','-','- ','!','.',';','?']
  prefix+=',' if !(breaks.any? {|d| prefix.ends_with? d})
  prefix
end

SELLA_MSGS = [
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
      'In 100 years we will all be dead anyway. No point in stressing about anything.',
      'Slow and steady wins the race.',
      'The race is long. And in the end - it\'s only with yourself.',
      "Don't waste your time on jealousy. Sometimes you're ahead, sometimes you're behind",
      'It is always now. We are always worried about the future, we should not forget to appreciate whatever we can from the present moment.',      
      'Contentness is a state of mind',
      'Happiness is a way of life. Choose to be happy and relaxed.',
      'Happiness is a journey, not a destination :)',
      'Everything is Sababa',
      "Don't sweat the small stuff",
      "Don't compare yourself to other people. You don't know their story; you don't know the struggles and the problems they are dealing with.",
      "Do what you choose - enjoy what you get.",
      "Remember to smile and be cheerful! It will make others happy, and more importantly - it will make you happy. :)"  
  ]

LILIYA_MSGS = [
  'Just think how far you have come.',
  'Remember how strong you are.',
  'Remember that you always worry - and things always turn out all right. So they will probably turn out all right this time, too.',
  'You are smart, talented, young and hard-working. You\'re going to be perfectly fine.',
  'Worrying does not help. Focus on something positive.',
  'No point in stressing. Do what you gotta do, and move on.',
  'Life is not perfect - but it is pretty great!',
  'What positive thing do you have to look forward to today?',
  'What was the best thing about yesterday?',
  'Fun fact: you are alive, healthy, independent and free. Your life is pretty great!',
  'Life is one big adventure, and you are your own star.',
  'There are ups and downs, but the overall vector is clear: things are good, and just improving and improving.',
  'Things take take. Do not stress about momentary difficulties. You are making progress.',
  'All we have is but a fleeting few years on a pale blue dot in the middle of the Universe, before the lights go out, probably forever. We don\'t understand the universe or life very well - but we might as well do our best to enjoy them.',
  'Your worries and anxities come from thoughts inside your own mind. The outside world is fine, and everybody and everything is fine :)',
  'Relaaaaaaaaaaax ;)',
  'It\'s all good. Everything is ok. :)',
  'Everything is awesome! :)',
  "You're doing fantastic.",
  "Remember to rule your mind, and not let your anxities rule you.",
  "Today is a great day!",
  "You are great just the way you are.",
  "Be proud of yourself!",
  "Don't overthink stuff. Live life and enjoy the good parts.",
  "Don't compare yourself to strangers on the Internet. You are comparing their 'highlight reel' to your 'behind-the-scenes'.",
  "Everything is going to be just fine :)",
  "Folks are usually about as happy as they make their minds up to be. -Lincoln",
  "It’s the moments that I stopped just to be, rather than do, that have given me true happiness -Richard Branson",
  "Happiness does not come from outside - but from a choice to accept and rejoice in what life has.",
  "Happiness depends upon ourselves -Aristotle",
  "Today is an awesome day. This week is a great week. This year has been a great year.",
  "Pause to reflect on some awesome things you have done recently. Man, aren't you awesome?",
  "If whatever you are doing is not making you happy - take a break. Take 5 minutes to clear your head. Or 10 minutes. Or a day off. What's gonna happen?",
  "Life is short. Enjoy is now.",
  "Have a great day!" 
]

def get_msg_body(user)
  return SELLA_MSGS.sample  if user[:name] == 'sella'
  return (SELLA_MSGS+LILIYA_MSGS).sample if user[:name] == 'liliya'
end

def get_msg_emoji 
  ["😀", "😁", "😂", "😃", "😄", "😅", "😆", "😉", "😊", "😋", "😎", "😍", "😘", "😚", "😌", "😛", "😜", "😝", "😇", "😸", "😹", "😻", "😼", "😽", "👼", "💪", "👌", "👍", "✊", "👏"].sample
end

