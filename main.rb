load "сaesarCode.rb"
puts "Hi, enter number of shifts. The number makes sense, if it's from 1 to 25."
shift = gets.to_i
begin
  if(shift > 0 && shift < 26)
    encrypt(shift)
  else
    raise Exception
  end
rescue Exception
  puts "Wrong number"
end