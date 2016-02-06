require 'test_helper'

class ExamModificationTest < ActionDispatch::IntegrationTest
  setup do
    # Also redirects to exams index
    login_as(users(:tom), "123456")
  end

  test "should be able to view exams" do
    visit('/exams')

    users(:tom).exams.each do |exam|
      assert page.has_selector?('li', text: exam.name)
    end
  end

  test "should be able to create new exam" do
    visit('/exams/new')
    fill_in('Name', with: 'Exam 3')
    click_on('Create Exam')

    assert page.has_selector?('h1', text: 'Exam 3')
  end

  test "should not create empty exam" do
    assert_no_difference 'Exam.count' do
      visit('/exams/new')
      click_on('Create Exam')
    end

    assert page.has_selector?('label', text: 'Name')
  end

  test "should be able to view exam" do
    visit(exam_path(exams(:exam1)))
    assert page.has_selector?('h1', text: 'Exam 1')

    visit(exam_path(exams(:exam2)))
    assert page.has_selector?('h1', text: 'Exam 2')
  end

  test "user should only see their exams" do
    assert_not page.has_selector?('li', text: "Jim's Exam")
    visit(exam_path(exams(:jim_exam)))
    assert has_current_path?('/exams')
  end

end
