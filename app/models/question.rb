class Question < ActiveRecord::Base
  belongs_to :exam
  validates :text, presence: true
  validates :exam, presence: true
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 1 }

  # Don't require; assign automatically if not present
  #validates :number, numericality: { greater_than_or_equal_to: 1 }

  before_create :assign_number

  def is_last_question_of_exam?
    self.number == self.exam.questions.count
  end

  private

    def assign_number
      self.number ||= exam.questions.count + 1
    end
end
