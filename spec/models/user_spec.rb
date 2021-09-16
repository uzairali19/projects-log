require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Should have many' do
    it 'Votes' do
      have_many :votes
    end
    it 'Categories' do
      have_many :categories
    end
    it 'Projects' do
      have_many :projects
    end
  end
  context 'Should not have' do
    it 'Nil value for name' do
      user = create(:user)
      if user.name.nil?
        expect(user).to_not be_valid
      else
        expect(user).to be_valid
      end
    end
  end
end
