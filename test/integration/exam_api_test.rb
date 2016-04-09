require 'test_helper'

class ExamApiTest < ActionDispatch::IntegrationTest
  setup do
    @headers ||= { 'CONTENT_TYPE' => 'application/json' }
    api_login_as(users(:tom), '123456')
  end

  test "should get all exams" do
    get '/api/v1/exams.json', nil, @headers

    assert_response :success

    assert_equal 2, json["data"].length
  end

  test "should get specific exam" do
    get "/api/v1/exams/#{exams(:exam1).id}.json", nil, @headers

    assert_response :success

    assert_equal exams(:exam1).name, exam_params[:name]
  end

  test "should not get another persons exam" do
    get "/api/v1/exams/#{exams(:jim_exam).id}.json", nil, @headers

    assert_response :missing
  end

  test "should be able to create new exam" do
    exam = Exam.new(name: "JSON Exam", user: users(:tom))

    assert exam.valid?

    assert_difference 'Exam.count', 1 do
      post '/api/v1/exams.json', serialize_exam(exam), @headers
    end

    assert_not_nil users(:tom).exams.find_by(name: "JSON Exam")
  end

  test "should be able to update exam" do
    exam = users(:tom).exams.first

    exam.name = "Updated via JSON"

    patch "/api/v1/exams/#{exam.id}", serialize_exam(exam), @headers

    assert_equal "Updated via JSON", Exam.find(exam.id).name
  end

  test "should not update other user's exam" do
    exam = users(:jim).exams.first

    exam.name = "Won't work"

    patch "/api/v1/exams/#{exam.id}", serialize_exam(exam), @headers

    assert_nil Exam.find_by(name: "Won't work")
  end

  test "should be able to destroy exam" do
    exam = users(:tom).exams.first

    assert_difference 'Exam.count', -1 do
      delete "/api/v1/exams/#{exam.id}", nil, @headers
    end
  end

  test "should not destroy other user's exam" do
    exam = users(:jim).exams.first

    assert_no_difference 'Exam.count' do
      delete "/api/v1/exams/#{exam.id}", nil, @headers
    end
  end

  test "should not use API without auth token" do
    get '/logout'

    get '/api/v1/exams.json'

    assert_response :unauthorized
  end

  private

  def exam_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(json)
  end

  def serialize_exam(exam)
    serializer = ExamSerializer.new(exam)
    serialization = ActiveModel::Serializer::Adapter.create(serializer)
    serialization.to_json
  end
end
