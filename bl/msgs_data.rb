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
      "Life is amazing - just take it all in",
      "Enjoy life now :)",
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
      "Remember to smile and be cheerful! It will make others happy, and more importantly - it will make you happy. :)",
      "If you're having negative thoughts - ignore them.",
      "Be happy",
      "Everything is great",
      "Life is going great",
      "Today is going fantastic",
      "all is fine",
      "all is well",
      "Remember you promised yourself not to worry",
      "Remember you set yourself a promise - not to worry",
      "Remember to not worry at all times",
      "Remember we always a challenge. We must relax.",
      "Remember to take things easy. Nothing really matters.",
      "Remember nothing really matters.",
      "Nothing actually matters that much",
      "You are most certainly overworrying yourself :)",
      "Everything is OK",
      "Be present now. Do not worry about the future",
      "Less worrying - more enjoying life :)",
      "You are crushing it",
      "Don't worry man - it's all working out",
      "Remember you told yourself not to worry.",
      "You promised me not to worry",
      "This is the future you were worried about. Everything is great.",
      "The future is now. Everything is great now, and everything will be great in the future. :)"
      "Be optimistic. You might as well.",
      "Be optimistic - it makes everything better.",
      "Life will be even better than it is right now.",
      "Everything's going to be fine.",
      "You will have time for everything."
      "There's going to be enough time."
      "You're doing exactly the right thing.",
      "Don't get angry; it ain't worth it."
      "No point in worrying.",
      "Do whatever you're goinna do; do not waste time worrying about it.",
      "Don't feel any need to rush.",
      "Everything is ok. Everything is going to turn out just fine.",
      "It's a nice, relaxed day."
  ]


SELLA_MSGS += [
  'YES YOU CAN',
  "You can do it!",
  'You are unbreakable',
  'You are fucking awesome'
]

FROM_LILIYA = ["Sella, Think about one thing that made you happy today",
  "Sella, Think about one thing that made you happy this week",
  "Sella, Think about one thing that made you happy this month",
  "Sella, you are smart, you can solve this!",
  "Sella, you are hard-working, you can deal with it",
  "Sella, you are talented, all problems are but a way to grow",
  "Sella, You're never given a dream without also being given the power to make it tru",
  "Sella, you do not exist to impress the world. you exist to live your life in a way that will make you happy.",
  "Sella, We teach best what we most need to learn.",
  "Sella, Learning is finding out what you already know. Doing is demonstrating that you know it. Teaching is reminding others that they know just as well as you. You are all learners, doers, teachers",
  "Sella, Believe you know all the answers, and you know all the answers. Believe you're a master, and you are.",
  "Sella, You seek problems because you need their gifts.",
  "Sella, Avoid problems, and you'll never be the one who overcame them",
  "Sella, take a deep breath, look outside a window and see something new outside",
  "Sella, take a break and think about one person that loves and cares about you",
  "Sella, take a break and think about a person that is an inspiration to you",
  "Sella, think about how you overcame a problem and how that made you feel",
  "Sella, you are loved ♥ ♥ ♥",
  "Sella, you are in insiration",
  "Sella, you are impressive!",
  "Sella, you changed lives of many people around you for better",
  "Sella, relax and let go, everything is going great!",
  "Sella, relax and let go, everything is going by the plan",
  "Sella, you achieved so much",
  "Sella, Optimism is the faith that leads to achievement.",
  "Sella, Life is 10% what happens to you and 90% how you react to it. ",
  "Sella, You can never cross the ocean until you have the courage to lose sight of the shore",
  "Sella, you have so many reasons to be happy: you are healthy, succesfful, ambitious and talented, you have loving family and friends!"
]


TO_LILIYA = [
  'Liliya- Just think how far you have come.',
  'Liliya- Remember how strong you are.',
  'Liliya- Remember that you always worry - and things always turn out all right. So they will probably turn out all right this time, too.',
  'Liliya- You are smart, talented, young and hard-working. You\'re going to be perfectly fine.',
  'Liliya - Worrying does not help. Focus on something positive.',
  'Liliya - No point in stressing. Do what you gotta do, and move on.',
  'Liliya - Life is not perfect - but it is pretty great!',
  'Liliya - What positive thing do you have to look forward to today?',
  'Liliya... what was the best thing about yesterday?',
  'Liliya... fun fact: you are alive, healthy, independent and free. Your life is pretty great!',
  'Liliya... life is one big adventure, and you are your own star.',
  'Liliya... There are ups and downs, but the overall vector is clear: things are good, and just improving and improving.',
  'Liliya.. things take time. Do not stress about momentary difficulties. You are making progress.',
  'Liliya.. all we have is but a fleeting few years on a pale blue dot in the middle of the Universe, before the lights go out, probably forever. We don\'t understand the universe or life very well - but we might as well do our best to enjoy them.',
  'Liliya, your worries and anxities come from thoughts inside your own mind. The outside world is fine, and everybody and everything is fine :)',
  'Liliya, Relaaaaaaaaaaax ;)',
  'Liliya, it\'s all good. Everything is ok. :)',
  'Liliya - Everything is awesome! :)',
  "Liliya -- You're doing fantastic.",
  "Liliya -- Remember to rule your mind, and not let your anxities rule you.",
  "Liliya - Today is a great day!",
  "Liliya - You are great just the way you are.",
  "Liliya - Be proud of yourself!",
  "Liliya - Don't overthink stuff. Live life and enjoy the good parts.",
  "Liliya - Don't compare yourself to strangers on the Internet. You are comparing their 'highlight reel' to your 'behind-the-scenes'.",
  "Liliya - Everything is going to be just fine :)",
  "Liliya - Folks are usually about as happy as they make their minds up to be. -Lincoln",
  "Liliya - It’s the moments that I stopped just to be, rather than do, that have given me true happiness -Richard Branson",
  "Liliya - Happiness does not come from outside - but from a choice to accept and rejoice in what life has.",
  "Liliya - Happiness depends upon ourselves -Aristotle",
  "Liliya - Today is an awesome day. This week is a great week. This year has been a great year.",
  "Liliya - Pause to reflect on some awesome things you have done recently. Man, aren't you awesome?",
  "Liliya - If whatever you are doing is not making you happy - take a break. Take 5 minutes to clear your head. Or 10 minutes. Or a day off. What's gonna happen?",
  "Liliya - Life is short. Enjoy is now.",
  "Liliya - Have a great day!" 
]

def get_msg_body(user)
  SELLA_MSGS.sample
  # return (SELLA_MSGS+FROM_LILIYA).sample if user[:name] == 'sella'
  # return (SELLA_MSGS+TO_LILIYA).sample if user[:name] == 'liliya'
end

def get_msg_emoji 
  ["😀", "😁", "😂", "😃", "😄", "😅", "😆", "😉", "😊", "😋", "😎", "😍", "😘", "😚", "😌", "😛", "😜", "😝", "😇", "😸", "😹", "😻", "😼", "😽", "👼", "💪", "👌", "👍", "✊", "👏"].sample
end

