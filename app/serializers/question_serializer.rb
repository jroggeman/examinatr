class QuestionSerializer < ActiveModel::Serializer
  attribute :position, key: :number
  attributes :points, :text, :answer, :id
end
