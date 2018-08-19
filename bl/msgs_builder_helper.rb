def clean_phrase(str)
  str.strip.split.join(" ") # clean up whitespace
  str = fix_capitalization(str)
  str
end

def fix_capitalization(str)  
  words = str.split
  words = words.each_with_index.map {|word,idx| 
    word = word.capitalize if (idx==0) || caps_should_follow(words[idx-1])
    word
  }.join(' ')
end

def caps_should_follow(w) 
  # puts "checking  caps_should_follow "+w
  ['?','.','!'].any? { |c| w.ends_with? c }
end

def print_many_msgs
  100.times { puts build_msg }
end