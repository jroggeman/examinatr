require 'test_helper'

class SpaTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = :selenium

    login_as(users(:tom), '123456')
  end

  teardown do
    Capybara.use_default_driver
  end

  test "can view questions for exam" do
    visit('/ember/exams')
    click_on('Exam 1')

    assert page.has_selector?('a', text: 'First question')
    assert page.has_selector?('a', text: 'Second question')
  end

  test "can create new exam" do
    visit('/ember/exams')
    fill_in('exam-name', with: 'Test Exam')
    click_on('Add')

    assert page.has_selector?('h1', text: 'Test Exam')
  end

  test "can create question" do
    visit('/ember/exams')
    click_on('Exam 1')

    click_on('New question')
    fill_in('Points', with: '5')
    fill_in('Text', with: 'This is a question')
    fill_in('Answer', with: 'New answer')
    click_on('Add Question')

    assert page.has_selector?('a', text: 'This is a question')
  end

  test "can update question" do
    visit('/ember/exams')
    click_on('Exam 1')

    click_on('First question')
    fill_in('Points', with: '10')
    click_on('Update Question')

    visit('/ember/exams')
    click_on('Exam 1')

    assert page.has_selector?('a', text: '10 points')
  end

  test "can delete question" do
    visit('/ember/exams')
    click_on('Exam 1')

    click_on('First question')
    click_on('Delete Question')
  end
end
