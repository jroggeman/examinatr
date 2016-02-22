require 'test_helper'

class ExamRenderTest < ActionDispatch::IntegrationTest
  setup do
    login_as(users(:tom), '123456')
  end

  test "can render exam" do
    visit('/exams')
    click_on('Exam 1')
    click_on('Render exam')

    assert has_current_path?(render_for_print_exam_path(exams(:exam1), format: :pdf))
  end

  test "can render with answers" do
    visit('/exams')
    click_on('Exam 1')
    click_on('Render with answers')

    assert has_current_path?(render_for_print_exam_path(exams(:exam1), format: :pdf, answer_key: true))
  end
end
