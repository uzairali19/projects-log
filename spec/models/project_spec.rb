require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'Should belong to' do
    it 'User' do
      belong_to :user
    end
    it 'Course' do
      belong_to :course
    end
  end
  context 'Should not have' do
    it 'Nil value for project' do
      user = create(:user)
      course = create(:course, user_id: user.id)
      project = create(:project, course_id: course.id, user_id: user.id)
      if project.project.nil?
        expect(project).to_not be_valid
      else
        expect(project).to be_valid
      end
    end
  end
end
