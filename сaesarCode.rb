def encrypt(shift)
  file = File.new("text.txt", "r:UTF-8")
  text = file.read
  letters = text.chars
  letters = letters.map do |x| 
    if(x != " " && x != "\n")
      ((x.ord + shift) < 123 ? (x.ord + shift) : (x.ord + shift) - 26).chr
    else
      x
    end
  end  
File.open(File.new("output.txt", "w:UTF-8"), 'w') { |file| file.write(letters.join()) }
puts "Well done"
end

