class QuestionSerializer < ActiveModel::Serializer
  attributes :number, :points, :text, :answer, :id
end
