class Project < ApplicationRecord
  validates :project, presence: true, length: { maximum: 50 }
  validates :hours, presence: true

  belongs_to :user
  has_many :courses
end
