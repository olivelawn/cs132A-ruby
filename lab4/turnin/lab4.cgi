#!/usr/local/bin/ruby

require 'cgi_helper'
require 'cgi'
require 'erb'
include CGIHelper

class Student
  attr_accessor :number, :user_name, :password, :uid, :gid, :gcos_field, :directory, :shell, :first_name, :last_name
  @@count = 0

  def initialize
    @@count += 1
    self.number = @@count
  end

  def getcount
    @@count
  end

  def each(*args, &block)

  end

  def first_last_from_gcos
    if self.gcos_field == ""
      self.first_name="-no data-"
      self.last_name="-no data-"
    else
      namearray = self.gcos_field.split(/\s+/)
        if namearray.length == 2
          if namearray[1].downcase.scan(/^./)[0][0] < "l"[0]
            self.first_name=namearray[0].ucwords
            self.last_name=namearray[1].ucwords
          else
            self.first_name=namearray[0].alternate_case
            self.last_name=namearray[1].alternate_case
          end

        elsif namearray.length == 3
          if namearray[2].downcase.scan(/^./)[0][0] < "l"[0]
            self.first_name=(namearray[0] + " " + namearray[1]).ucwords
            self.last_name=namearray[2].ucwords
          else
            self.first_name=(namearray[0] + " " + namearray[1]).alternate_case
            self.last_name=namearray[2].alternate_case
          end
        end
    end
  end

end

class String
  def alternate_case
    # alternate upper and lower case characters
    count = 0
    out = ''
    self.scan(/./m) do |b|
        if count == 0
          out << b.upcase && count = 1
        else
          out << b.downcase && count = 0
        end
    end
    out
  end

  def ucwords
    # capitalize all words in a string
    self.gsub(/\b\w/){$&.upcase}
  end
end

def main()

@sortedarrayofstudents = []
arrayofstudents = []
plines = File.readlines('/etc/passwd')
glines = File.readlines('/etc/group')
@column_header = %w{number user_name password uid gid gcos_field directory shell first_name last_name}

loginids = (glines.collect { |line| line if line =~ /^c77734/ }).compact!.to_s.split(':')[3].chomp.split(',')
passwds = (plines.collect { |line| line.chomp if loginids.include?("#{line.split(':')[0]}") }).compact

passwds.each do |passwdentry|
  student = Student.new

  tmparray = passwdentry.split(':')
  student.user_name = tmparray[0]
  student.password = tmparray[1]
  student.uid = tmparray[2].to_i
  student.gid = tmparray[3].to_i
  student.gcos_field = tmparray[4]
  student.directory = tmparray[5]
  student.shell = tmparray[6]
  student.first_last_from_gcos
  arrayofstudents << student
end

rhtml = File.read('lab4_template.html')
erb = ERB.new(rhtml)

http_header()
@sort_by = CGI.new.params['sort_by'].to_s
  if @sort_by == ""
    #puts "@sort_by is #{@sort_by}, don't sort"
    @sortedarrayofstudents = arrayofstudents
  else
    #puts "@sort_by is #{@sort_by}, sort!"
    @sortedarrayofstudents = arrayofstudents.sort_by { |student| student.send @sort_by }
  end
puts erb.result(binding)

end

main
