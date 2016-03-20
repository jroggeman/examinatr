require 'test_helper'

class SpaTest < ActionDispatch::IntegrationTest
  setup do
    # Need JS to test SPA
    Capybara.current_driver = :selenium
    login_as(users(:tom), '123456')
  end

  teardown do
    Capybara.use_default_driver
  end

  test "Can view questions for exam" do
    visit('/ember/exams')
    click_on('Exam 1')

    assert page.has_selector?('a', text: 'First question')
    assert page.has_selector?('a', text: 'Second question')
  end

  test "Can create question" do
    visit('/ember/exams')
    click_on('Exam 1')

    click_on('New question')
    fill_in('Points', with: '5')
    fill_in('Text', with: 'New question')
    fill_in('Answer', with: 'New answer')
    click_on('Add Question')

    assert page.has_selector?('a', text: 'New question')
  end
end
