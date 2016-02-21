require 'test_helper'

class ExamApiTest < ActionDispatch::IntegrationTest
  setup do
    # Capybara uses separate session, so must login via POST
    post '/login', session: { username: users(:tom).username, password: "123456" }
  end

  test "should get all exams" do
    get '/api/v1/exams.json'

    assert_response :success

    assert_equal json["data"].length, 2
  end

  test "should get specific exam" do
    get "/api/v1/exams/#{exams(:exam1).id}.json"

    assert_response :success

    assert_equal exams(:exam1).name, exam_params[:name]
  end

  test "should not get another persons exam" do
    get "/api/v1/exams/#{exams(:jim_exam).id}.json"

    # TODO This should be handled better
    assert_redirected_to exams_path
  end

  test "should be able to create new exam" do
    exam = Exam.new(name: "JSON Exam", user: users(:tom))

    assert exam.valid?

    serializer = ExamSerializer.new(exam)
    serialization = ActiveModel::Serializer::Adapter.create(serializer)

    puts serialization.to_json

    post '/api/v1/exams.json', serialization.to_json
  end

  private

    def exam_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(json)
    end
end
