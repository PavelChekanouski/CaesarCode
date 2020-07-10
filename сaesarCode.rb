class CaesarCode
  
  @shift
  
  def initialize(shift)
    @shift = shift
  end

  def get_shift
    @shift
  end

  def decrypt()
    letters = File.new("encrypted_text.txt", "r:UTF-8").read.chars
    letters = letters.map do |x|
      case x.ord
        when 65..90 then ((x.ord - self.get_shift) > 64 ? (x.ord - self.get_shift) : (x.ord - self.get_shift) + 26).chr
        when 97..122 then ((x.ord - self.get_shift) > 96 ? (x.ord - self.get_shift) : (x.ord - self.get_shift) + 26).chr
        when " ".ord then x
        when "\n".ord then x
      end
    end  
    File.open("decrypted_text.txt", "w:UTF-8") { |file| file.write(letters.join()) }
    puts "Decryption done"
  end

  def encrypt()
  letters = File.new("text.txt", "r:UTF-8").read.chars
  letters = letters.map do |x| 
    if(x != " " && x != "\n")
      ((x.ord + self.get_shift) < 123 ? (x.ord + self.get_shift) : (x.ord + self.get_shift) - 26).chr
    else
      x
    end
  end  
  File.open("encrypted_text.txt", "w:UTF-8") { |file| file.write(letters.join()) }
  puts "Encryption done"
  end

end
