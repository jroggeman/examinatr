class AddAnswerToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :answer, :text
  end
end
