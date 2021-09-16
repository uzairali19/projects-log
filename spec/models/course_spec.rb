require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'Should' do
    it 'Belong to User' do
      belong_to :user
    end
    it 'have many projects' do
      have_many :projects
    end
  end
  context 'Should not have' do
    it 'Nil value for course' do
      user = create(:user)
      course = create(:course, user_id: user.id)
      if course.course.nil?
        expect(course).to_not be_valid
      else
        expect(course).to be_valid
      end
    end
  end
end
