#!/usr/bin/ruby

module CgiHelper 

 def render_file_with_erb(file) 

   rhtml = File.read file
   unless rhtml.nil? 

   render_erb(rhtml)
   else
   raise "Could not open " + file 

   end 

 end

 def render_erb(rhtml) 

 require 'erb' 

 erb = ERB.new(rhtml) 

 erb.result(binding) 

 end 

end 
