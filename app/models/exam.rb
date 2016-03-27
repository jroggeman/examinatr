class Exam < ActiveRecord::Base
  belongs_to :user
  has_many :questions, -> { order("position ASC") }
  validates :name, presence: true
  validates :user, presence: true

  def total_points
    self.questions.inject(0) { |sum, q| sum + q.points }
  end
end
