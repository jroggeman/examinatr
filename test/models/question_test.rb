require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "Can create valid questions" do
    assert_difference 'Question.count', 1 do
      q = Question.new
      q.exam = exams(:exam1)
      q.text = 'This is a question'
      q.points = 5

      assert q.save
    end
  end

  test "Can't save question without text" do
    assert_no_difference 'Question.count' do
      q = Question.new
      q.exam = exams(:exam1)
      q.text = ''
      q.points = 5

      q.save
    end
  end

  test "Can't save question without points" do
    assert_no_difference 'Question.count' do
      q = Question.new
      q.exam = exams(:exam1)
      q.text = 'This is a question'

      q.save
    end
  end

  test "Can't save question without exam" do
    assert_no_difference 'Question.count' do
      q = Question.new
      q.text = 'This is a question'
      q.points = 5

      q.save
    end
  end
end
