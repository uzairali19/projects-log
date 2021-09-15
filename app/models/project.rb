class Project < ApplicationRecord
  validates :project, presence: true, length: { maximum: 50 }
  validates :hours, presence: true
  acts_as_votable

  belongs_to :user
  belongs_to :course
end
