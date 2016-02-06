require 'test_helper'

class QuestionsTest < ActionDispatch::IntegrationTest

  setup do
    login_as(users(:tom), '123456')
  end

  # New question
  test "can create a new question" do
    visit(exam_path(exams(:exam1)))

    click_on('Add Questions')
    assert page.has_selector?('h3', text: 'Question 3')
    assert_difference 'Question.count', 1 do
      fill_in('Points', with: 5)
      fill_in('Text', with: 'New question test')
      click_on('Save')
    end

    assert page.has_selector?('h3', text: 'Question 3')

    click_on('Back to exams')
    assert page.has_selector?('li', text: 'New question test')
  end

  # Previous question
  test "User can return to previous question" do
    visit(exam_path(exams(:exam1)))
    assert page.has_selector?('li', text: '(5 points) Second question')

    click_on('Add Questions')
    click_on('Previous')

    assert page.has_selector?('h3', text: 'Question 2')

    assert_no_difference 'Question.count' do
      fill_in('Points', with: 10)
      click_on('Save')
    end

    assert page.has_selector?('h3', text: 'Question 2')

    click_on('Back to exams')

    assert page.has_selector?('li', text: '(10 points) Second question')
  end

  # Next question
  test "User can move to the next existing question" do
    visit(exam_path(exams(:exam1)))

    click_on('Add Questions')
    click_on('Previous')
    click_on('Previous')
    click_on('Next')

    assert page.has_selector?('h3', text: 'Question 2')
    assert_equal find_field('Text').value, 'Second question'

    click_on('Back to exams')
  end

  # Next = new at end
  test "Clicking new while at last question moves to a new question" do
    visit(exam_path(exams(:exam1)))

    click_on('Add Questions')
    click_on('Previous')
    click_on('New')

    assert has_current_path?(new_exam_question_path(exams(:exam1)))

    click_on('Back to exams')
  end

  # No previous at end
  test "No previous button at the beginning" do
    visit(exam_path(exams(:exam1)))

    click_on('Add Questions')
    click_on('Previous')
    click_on('Previous')

    assert page.has_selector?('a', text: 'Back to exams')
    assert_not page.has_selector?('a', text: 'Previous')
  end
end
