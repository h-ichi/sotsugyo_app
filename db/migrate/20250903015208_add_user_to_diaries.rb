class AddUserToDiaries < ActiveRecord::Migration[7.2]
  def change
    add_reference :diaries, :user, null: true, foreign_key: true
  end
end
