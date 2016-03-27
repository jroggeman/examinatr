require 'test_helper'

class QuestionApiTest < ActionDispatch::IntegrationTest
  # test "stuff" do
  #   get '/api/v1/fewa', body, @headers
  #
  #   assert_response question_params[:text]
  # end

  setup do
    @headers ||= { 'CONTENT_TYPE' => 'application/json' }
    api_login_as(users(:tom), '123456')
  end

  test "can move up in list" do
    assert_equal 2, questions(:two).position

    post "/api/v1/questions/#{questions(:two).id}/move_up.json"

    assert_equal 1, question_params[:number]
    assert_equal 1, Question.find(questions(:two).id).position
  end

  test "can move down in list" do
    assert_equal 1, questions(:one).position

    post "/api/v1/questions/#{questions(:one).id}/move_down.json"

    assert_equal 2, question_params[:number]
    assert_equal 2, Question.find(questions(:one).id).position
  end

  def question_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(json)
  end

  def serialize_question(exam)
    serializer = ExamSerializer.new(exam)
    serialization = ActiveModel::Serializer::Adapter.create(serializer)
    serialization.to_json
  end
end
