class Question < ActiveRecord::Base
  belongs_to :exam
  validates :text, presence: true
  validates :exam, presence: true
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :number, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
