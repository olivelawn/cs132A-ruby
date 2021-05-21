#!/usr/bin/ruby
require 'profile'

# Create Exception classes for all attributes: telephone, employee_id, name
# For example
class TelephoneException < Exception
  def to_s 
    "Telephone number should be: d ddd ddd-dddd (where d is a digit/integer)" 
  end 
end

class EmployeeIdException < Exception
  def to_s 
    "Employee id number should be: cccdddddc (where c is a character and d is a digit)"
  end 
end

class NameException < Exception
  def to_s 
    "Name should be any sequence of characters and can include whitespace dashes and apostrophes"
  end 
end

class StudentIdException < Exception
  def to_s
    "Student ID should start with \"W\" followed by 8 digits"
  end
end

class HoursScheduledException < Exception
  def to_s
    "Hours Scheduled should be a digit between 1 and 999"
  end
end

class JobIdException < Exception
  def to_s
    "Job ID should be one or more characters, a colon, followed by 1 or more digits"
  end
end

class Employee 
  attr_accessor :name, :telephone, :employee_id

  def initialize(name, telephone, emp_id) 
    self.name = name 
    self.telephone = telephone 
    self.employee_id = emp_id
  end 

  def telephone=(telephone)
    if telephone =~ /^\d\s\d{3}\s\d{3}-\d{4}$/ 
      @telephone = telephone
    else 
      raise TelephoneException
    end 
  end 

  def name=(name)
    if name =~ /^[\s\w '-]+$/
      @name = name
    else
      raise NameException
    end 
  end 

  def employee_id=(employee_id)
    if employee_id =~ /^[a-zA-Z]{3}\d{5}[a-zA-Z]$/
      @employee_id = employee_id
    else
      raise EmployeeIdException
    end 
  end 
end

class StudentEmployee < Employee
  # Create three methods: student_id, hours_scheduled, and job_id
  # The setter methods should raise the appropriate exception. 
  # See the telephone methods in the Employee class
  attr_accessor :student_id, :hours_scheduled, :jod_id

  def student_id=(student_id)
    if student_id =~ /^W\d{8}$/
      @student_id = student_id
    else
      raise StudentIdException
    end
  end

  def hours_scheduled=(hours_scheduled)
    if hours_scheduled =~ /^\d{1,3}$/
      @hours_scheduled = hours_scheduled
    else
      raise HoursScheduledException
    end
  end

  def job_id=(job_id)
    if job_id =~ /^[a-zA-Z]+:\d+$/
      @job_id = job_id
    else
      raise JobIdException
    end
  end
end

