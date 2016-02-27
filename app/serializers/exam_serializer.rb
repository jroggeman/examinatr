class ExamSerializer < ActiveModel::Serializer
  attribute :name
  attribute :total_points, key: "total-points"

  has_many :questions
end
