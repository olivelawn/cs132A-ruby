#!/usr/local/bin/ruby

# Lab 1
# lab1.rb
# Parker Johnson
# Sep 7, 2009


the_string = <<-HERE
                    This string has leading space and too    MANY tabs and sPaCes betweenX
   the indiVidual  Words in each Line.X
  each Line ends with a accidentally  aDDED  X.X
                in this lab you wilL WRITE code that "sAnITizES" this string by normalizingX
   ("normalizing" means   capitalizing sentences   and setting otherX
  characters to lower case)     and removes in       the extra spaces between WOrds.X
HERE

puts "the_string:"
puts "#{the_string}"
puts

puts "1.1 squeeze(" "):"
puts "#{the_string.squeeze(" ").gsub(/^\s/, '')}"
puts

puts "1.2 downcase:"
puts "#{the_string.squeeze(" ").gsub(/^\s/, '').downcase}"
puts

puts "1.3 upcase:"
puts "#{the_string.squeeze(" ").gsub(/^\s/, '').upcase}"
puts

puts "1.4 Capitalize:"
the_string.squeeze(" ").gsub(/^\s/, '').each { |line| puts "#{line.capitalize}" }
puts

puts "1.5 Removing the Ending 'X':"
the_string.squeeze(" ").gsub(/^\s/, '').each { |line| puts "#{line.capitalize.sub(/[xX]$/, '')}" }
puts

puts "1.6 each byte: Decimal"
the_string.squeeze(" ").gsub(/^\s/, '').each { |line| line.capitalize.sub(/[xX]$/, '').each_byte { |c| print c, ' ' } }
puts
puts

puts "1.6 each byte: Hex"
the_string.squeeze(" ").gsub(/^\s/, '').each { |line| line.capitalize.sub(/[xX]$/, '').each_byte { |c| printf("%x ", c) } }
puts
puts

puts "1.7 split and print array of words(against original unmodified the_string):"
array_of_strings = the_string.split
puts "#{array_of_strings}"
puts

puts "1.8 crypt(against original unmodified the_string):"
the_string_encrypted = the_string.crypt("salt")
puts "the_string.crypt(\"salt\") is:"
puts "#{the_string_encrypted}"
puts

puts "1.9 replace(against original unmodified the_string):"
the_string_tmp = String.new(the_string)
the_string_stripped = the_string[100,the_string.length - 100]
the_string_hundred_char = the_string[0,100]

puts "the_string.object_id is #{the_string.object_id}"
puts
the_string.replace(the_string_stripped)
puts "the_string stripped of its first 100 characters is:"
puts " #{the_string}"
puts
puts "the_string.object_id is #{the_string.object_id}"
puts
the_string.replace(the_string_hundred_char.reverse + the_string_stripped)
puts "the_string with its first 100 characters reversed is:"
puts "#{the_string}"
puts
puts "the_string.object_id is #{the_string.object_id}"
puts
the_string.replace(the_string_hundred_char.squeeze + the_string_stripped)
puts "the_string with its first 100 characters squeezed is:"
puts "#{the_string}"
puts
puts "the_string.object_id is #{the_string.object_id}"
puts
the_string.replace(the_string_hundred_char.upcase + the_string_stripped)
puts "the_string with its first 100 characters upper-cased is:"
puts "#{the_string}"
puts
puts "the_string.object_id is #{the_string.object_id}"
puts
the_string.replace(the_string_tmp)


puts "1.10 Inspect(against original unmodified the_string):"
puts "#{the_string.inspect}"
