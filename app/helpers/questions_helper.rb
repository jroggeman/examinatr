module QuestionsHelper
  def previous_question_path(exam, question)
    previous_number = question.number - 1
    q = exam.questions.find_by(number: previous_number)
    edit_exam_question_path(exam, q)
  end

  def next_question_path(exam, question)
    if question.is_last_question_on_exam?
      nil
    else
      previous_number = question.number + 1
      q = exam.questions.find_by(number: previous_number)
      edit_exam_question_path(exam, q)
    end
  end
end
