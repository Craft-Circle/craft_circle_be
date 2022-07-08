require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:available) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:type) }
    it { should validate_numericality_of(:amount) }
    it { should validate_inclusion_of(:available).in?([true, false]) }
  end
end
