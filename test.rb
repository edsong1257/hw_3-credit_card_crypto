#implementation found @ http://stackoverflow.com/questions/9188360/implementing-the-luhn-algorithm-in-ruby
#    nums_a = number.to_s.chars.map(&:to_i)

def credit_card_valid?(account_number)
  #stringnum = "79927398713"
  #nums_a = stringnum.to_s.chars.map(&:to_i) # SS start code

  digits = account_number.to_s.chars.map(&:to_i)
  puts "Original digits are: ", digits.join
  check = digits.pop
  puts "check digit is ", check
  puts "modified digits are: ", digits.join

  sum = digits.reverse.each_slice(2).map do |x, y|
    [(x * 2).divmod(10), y || 0]
  end.flatten.inject(:+)
  puts "sum before final clac is: ",sum
  ans = ((10 - sum) % 10) 
  puts "afer calc final ans is: ", ans
  ans == check
end

#puts credit_card_valid?("79927398713")
#puts credit_card_valid?("6011732236366813")
puts credit_card_valid?("6011368353866440"), " expected true"
#puts credit_card_valid?("346350675600102")