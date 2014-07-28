def who_are_you
  q_and_a = { 'what is your name?' => '', 'how old are you' => '' }
  q_and_a.each_key { |q| puts q; q_and_a[q] = gets.chomp; puts '\n'; }
  puts "Your name is #{qanda.values[0]} and you are #{qanda.values[1]} years old"
end

who_are_you