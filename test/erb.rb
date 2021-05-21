#!/usr/bin/ruby

#!/usr/local/bin/ruby 

require 'cgi_helper' 

include CgiHelper

#http_header 

@name = 'Yosemite Sam' 

puts render_file_with_erb('index.rhtml')


