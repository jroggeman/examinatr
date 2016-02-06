class ChangeQuestionText < ActiveRecord::Migration
  def change
    change_column :questions, :text, :text
  end
end
