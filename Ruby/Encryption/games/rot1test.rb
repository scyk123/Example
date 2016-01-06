require '../Encryption.rb'

dict = Encryption::LOWERCASE_DICT
rot = Encryption::Rot.new(1)
times, n_times, l_times = [], [], []

# puts 'Rot1 testing - a = 26, b = 1, 1 = b, 26 = a'
while true

  i = rand(26)
  q = [true, false].sample  
  l = dict[i]
  real_l = rot.encrypt_c("#{l}")
  n = (i + 1).to_s
  
  guess = q ? real_l : n
  answer = q ? n : real_l

  print guess + ': '
  
  start = Time.now
  input = gets.chomp
  stop = Time.now
  t = stop - start
  times << t
  sums = times.reduce(:+) / times.length

  if q
    l_times << t
    ln_length = l_times.length
    ln_total = l_times.reduce(:+)
    ln_sums = ln_total / ln_length
  else
    n_times << t
    ln_length = n_times.length
    ln_total = n_times.reduce(:+)
    ln_sums = ln_total / ln_length
  end
  
  exit if input.match(/quit/)

  print (input == answer ?
    'Correct' :
    "Incorrect #{input}:#{answer}")

  puts " #{t.to_s[0..4]}%#{ln_sums.to_s[0..4]}%#{sums.to_s[0..4]}"
      
end
        

