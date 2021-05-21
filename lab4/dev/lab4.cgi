#!/usr/bin/ruby

require 'cgi_helper'
require 'cgi'
require 'erb'
include CGIHelper

rhtml = File.read('lab4_template.html')
erb = ERB.new(rhtml)

http_header()
puts erb.result(binding)

