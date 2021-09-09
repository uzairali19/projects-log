class AddProjectIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :project, null: false, foreign_key: true
  end
end
