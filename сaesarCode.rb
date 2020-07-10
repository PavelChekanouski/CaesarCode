class CaesarCode
  
  attr_reader :shift 

  def initialize(shift)
    @shift = shift
  end

  def decrypt(input_file_name, output_file_name)
    letters = File.new(input_file_name, "r:UTF-8").read.chars
    letters = letters.map do |x|
      case x.ord
        when 65..90 then ((x.ord - self.shift) > 64 ? (x.ord - self.shift) : (x.ord - self.shift) + 26).chr
        when 97..122 then ((x.ord - self.shift) > 96 ? (x.ord - self.shift) : (x.ord - self.shift) + 26).chr
        when " ".ord then x
        when "\n".ord then x
      end
    end  
    File.open(output_file_name, "w:UTF-8") { |file| file.write(letters.join()) }
    puts "Decryption done"
  end

  def encrypt(input_file_name, output_file_name)
  letters = File.new(input_file_name, "r:UTF-8").read.chars
  letters = letters.map do |x| 
    case x.ord
        when 65..90 then ((x.ord + self.shift) < 91 ? (x.ord + self.shift) : (x.ord + self.shift) - 26).chr
        when 97..122 then ((x.ord + self.shift) < 123 ? (x.ord + self.shift) : (x.ord + self.shift) - 26).chr
        when " ".ord then x
        when "\n".ord then x
      end
  end  
  File.open(output_file_name, "w:UTF-8") { |file| file.write(letters.join()) }
  puts "Encryption done"
  end

end