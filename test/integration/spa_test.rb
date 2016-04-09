require 'test_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :transaction
class SpaTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = :selenium

    login_as(users(:tom), '123456')
  end

  teardown do
    Capybara.use_default_driver
    DatabaseCleaner.clean
  end

  test "can view questions for exam" do
    visit('/exams')
    click_on('Exam 1')

    assert page.has_selector?('a', text: 'First question')
    assert page.has_selector?('a', text: 'Second question')
  end

  test "can create new exam" do
    visit('/exams')
    fill_in('exam-name', with: 'Test Exam')
    click_on('Add')

    assert page.has_selector?('h1', text: 'Test Exam')
  end

  test "can create question" do
    visit('/exams')
    click_on('Exam 1')

    click_on('New question')
    fill_in('Points', with: '5')
    fill_in('Text', with: 'This is a question')
    fill_in('Answer', with: 'New answer')
    click_on('Add Question')

    assert page.has_selector?('a', text: 'This is a question')
  end

  test "can update question" do
    visit('/exams')
    click_on('Exam 1')

    click_on('First question')
    fill_in('Points', with: '10')
    click_on('Update Question')

    visit('/exams')
    click_on('Exam 1')

    assert page.has_selector?('a', text: '10 points')
  end

  test "can create and delete question" do
    visit('/exams')
    click_on('Exam 1')

    click_on('New question')
    fill_in('Points', with: '5')
    fill_in('Text', with: 'This will be deleted')
    fill_in('Answer', with: 'New answer')
    click_on('Add Question')

    assert page.has_selector?('a', text: 'This will be deleted')

    click_on('This will be deleted')
    click_on('Delete Question')
    page.driver.browser.switch_to.alert.accept

    assert page.has_no_selector?('a', text: 'This will be deleted')
  end

  test "can move questions up and down" do
    visit('/exams')
    click_on('Exam 1')

    click_on('First question')

    assert page.has_selector?('h1', text: 'Question 1')

    click_on('Move Down')

    assert page.has_selector?('h1', text: 'Question 2')

    click_on('Move Down')

    assert page.has_selector?('h1', text: 'Question 2')

    click_on('Move Up')

    assert page.has_selector?('h1', text: 'Question 1')
  end
end
