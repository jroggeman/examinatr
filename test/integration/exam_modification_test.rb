require 'test_helper'

class ExamModificationTest < ActionDispatch::IntegrationTest
  def setup
    login_as(users(:tom), "123456")
  end

  test "should be able to view exams" do
    get user_exams_path(users(:tom))
    assert_response :success

    users(:tom).exams.each do |exam|
      assert_select "li", text: exam.name
    end
  end

  test "should be able to create new exam" do
    get new_user_exam_path(users(:tom))
    assert_response :success

    post_via_redirect user_exams_path(users(:tom)), exam: {
      name: "Exam 3"
    }

    assert_template 'exams/index'
    assert_select "li", text: "Exam 3"
  end

  test "should not create empty exam" do
    get new_user_exam_path(users(:tom))
    assert_response :success

    post user_exams_path(users(:tom)), exam: {
      name: ""
    }

    assert_template 'exams/new'
    assert_equal Exam.count, 2
  end
end
