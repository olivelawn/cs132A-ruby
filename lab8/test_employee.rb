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

