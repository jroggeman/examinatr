class ExamSerializer < ActiveModel::Serializer
  attribute :name

  has_many :questions
end
