class AddCourseIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :course, foreign_key: true
  end
end
