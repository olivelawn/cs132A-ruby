#!/usr/bin/ruby

# find the longest word 
@out = %w{ short longer longest longerest }.inject do |memo,word| 
  puts "memo is #{memo} word is #{word}"
  memo.length  >= word.length ? memo : word 
end

p @out
