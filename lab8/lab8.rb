#!/usr/bin/ruby
require 'profile'

#Lab8 by Parker Johnson.  The 1st file should be named employee.rb
#The second file should be named test_employee.rb

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

#!/usr/bin/ruby
require 'test/unit'
require 'employee'

class EmployeeTest < Test::Unit::TestCase

  def setup
    #@obj = Employee.new('Ann Annson', '1 415 555-1212', 'aBc12345b')   
    @obj = StudentEmployee.new('Ann Annson', '1 415 555-1212', 'aBc12345b')   
  end 

  def teardown
    # If we create any temporary files
    # we would unlink them here.
  end 

  def test_Employee_telephone_method
    assert_not_equal(TelephoneException, @obj.telephone, "We expect this to fail")
    assert_equal('1 415 555-1212', @obj.telephone, "If this fails we're in trouble.")
    assert_not_equal('nothing', @obj.telephone = '1 111 111-1111', "This should not show an error")
    assert_raise(TelephoneException) { @obj.telephone = '1 223 456x7890' }
  end 

  def test_flunk
 #   flunk  # always fails
  end 

  #
  # Create tests for the StudentEmployee methods
  #

  def test_StudentEmployee_studentid_method
    assert_not_equal('W87654321', @obj.student_id = 'W12345678', "We expect these to not be equal")
    assert_equal('W12345678', @obj.student_id = 'W12345678', "If this fails we're in trouble.")
    assert_not_equal('nothing', @obj.student_id = 'W12345678', "We expect these to not be equal")
    assert_raise(StudentIdException) { @obj.student_id = 'ABC123' }
  end

  def test_StudentEmployee_hoursscheduled_method
    assert_not_equal('123', @obj.hours_scheduled = '999', "We expect these to not be equal")
    assert_equal('999', @obj.hours_scheduled = '999', "If this fails we're in trouble.")
    assert_not_equal('nothing', @obj.hours_scheduled = '999', "We expect these to not be equal")
    assert_raise(HoursScheduledException) { @obj.hours_scheduled = '9999' }
  end

  def test_StudentEmployee_jobid_method
    assert_not_equal('faculty:4321', @obj.job_id = 'administration:1234', "We expect these to not be equal")
    assert_equal('administration:1234', @obj.job_id = 'administration:1234', "If this fails we're in trouble.")
    assert_not_equal('nothing', @obj.job_id = 'administration:1234', "We expect these to not be equal")
    assert_raise(JobIdException) { @obj.job_id = 'nocolon1234' }
  end
end

