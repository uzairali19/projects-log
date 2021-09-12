class Course < ApplicationRecord
  validates :course, presence: true, length: { maximum: 50 }

  belongs_to :user
  has_many :projects

  def allprojects
    @projects = Course.all
    @projects
  end
end
