class AddCourseIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :course, null: false, foreign_key: true
  end
end
