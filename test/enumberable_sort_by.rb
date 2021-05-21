#!/usr/bin/ruby

fields = [ :user_name, :password, :uid, :gid, :gcos_field, :home_dir, :shell ] 
students = [] 
`tail -800 /etc/passwd|tail -10`.each do |l| 
  tmp = {} 
  parts = l.chop!.split(':') 
  (fields.size - 1).downto(0) do |i| 
    tmp[fields[i]] = parts[i] 
  end 
  students << tmp 
end 
students.each {|s| puts s[:user_name]} 
puts
out = students.sort_by {|student| student[:user_name] } 
out.each {|s| puts s[:user_name]}

#students.select {|student| student[:user_name] =~ /er/i}.each do |s|
#  puts s[:user_name]
#end

