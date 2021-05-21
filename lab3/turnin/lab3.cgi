#!/usr/local/bin/ruby

class Student
  attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :directory, :shell, :first_name, :last_name
  @@count = 0

  def initialize
    @@count += 1
  end
  
  def getcount
    @@count
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

def starthtml()
  puts 'Content-type: text/html'
  puts
  puts '<html>
<head>
<title>Lab 3 by Parker Johnson cs132A</title>
<body>
<table border="1" cellspacing="2">
   <tr>
   <th>Number</th>
   <th>User Name</th>
   <th>Password</th>
   <th>Uid</th>
   <th>Gid</th>
   <th>Gcos Field</th>
   <th>Home Directory</th>
   <th>Login Shell</th>
   <th>First Name</th>
   <th>Last Name</th>
   </tr>
'
end

def endtable()
  puts '</table>'
end

def tabledata(val)
  puts "       <td class=\"\"> #{val} </td>"
end

def endhtml()
  puts '</body>'
  puts '</html>'
end

def main()
t = Time.now
start = t.to_f

#arrayofstudents = []
count = 1
plines = File.readlines('/etc/passwd')
glines = File.readlines('/etc/group')

loginids = (glines.collect { |line| line if line =~ /^c77734/ }).compact!.to_s.split(':')[3].chomp.split(',')
passwds = (plines.collect { |line| line.chomp if loginids.include?("#{line.split(':')[0]}") }).compact

starthtml()

passwds.each do |passwdentry|
  student = Student.new

  #singleton method
  def student.last_name
    if self.gcos_field == ""
      tabledata("-no data-")
      tabledata("-no data-")
    else
      namearray = self.gcos_field.split(/\s+/)
        if namearray.length == 2
          if namearray[1].downcase.scan(/^./)[0][0] < "l"[0]
            tabledata(namearray[0].ucwords)
            tabledata(namearray[1].ucwords)
          else
            tabledata(namearray[0].alternate_case)
            tabledata(namearray[1].alternate_case)
          end

        elsif namearray.length == 3
          if namearray[2].downcase.scan(/^./)[0][0] < "l"[0]
            tabledata((namearray[0] + " " + namearray[1]).ucwords)
            tabledata(namearray[2].ucwords)
          else
            tabledata((namearray[0] + " " + namearray[1]).alternate_case)
            tabledata(namearray[2].alternate_case)
          end
        end
    end
  end

  tmparray = passwdentry.split(':')
  student.user_name = tmparray[0]
  student.password = tmparray[1]
  student.uid = tmparray[2]
  student.gid = tmparray[3]
  student.gcos_field = tmparray[4]
  student.directory = tmparray[5]
  student.shell = tmparray[6]
   
  #now print out the html 
  puts '   <tr>'
  tabledata(student.getcount)
  tabledata(student.user_name)
  tabledata(student.password)
  tabledata(student.uid)
  tabledata(student.gid)
  tabledata(student.gcos_field)
  tabledata(student.directory)
  tabledata(student.shell)
  student.last_name
  puts '   </tr>'
  
end

endtable()
finish = Time.now 
print 'Elapsed time: ' + (finish.to_f - start.to_f).to_s
puts
endhtml()

end

main()
