require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  test "should have a name" do
    e = Exam.new
    e.name = ""
    e.user = users(:tom)

    assert_not e.save
  end

  test "should belong to someone" do
    e = Exam.new
    e.name = "Exam 1"
    e.user = nil

    assert_not e.save
  end

  test "should save when valid" do
    e = Exam.new
    e.name = "Exam 1"
    e.user = users(:tom)

    assert e.save
  end
end
