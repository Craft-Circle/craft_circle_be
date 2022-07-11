require 'rails_helper'

RSpec.describe Item do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:available) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:category) }
    it { should validate_numericality_of(:amount) }
    it { should validate_inclusion_of(:available).in?([true, false]) }
  end

  describe 'item creation' do
    phillip = User.new(name: 'Phillip', email: 'phillip@email.com')
    yarn = Item.new(
      name: 'Purple Yarn',
      category: 0,
      description: '.8 gauge purple yarn, 1 bundle',
      available: true,
      amount: 1,
      status: 0,
      user_id: phillip.id
    )
  end
end
