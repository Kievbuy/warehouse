require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { create(:category) }

  it 'has a valid factory' do
    expect( build(:category) ).to be_valid
  end

  describe "empty new object" do
    it "must not be valid" do
      new_category = described_class.new
      expect(new_category).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:products) }
    it { should have_and_belong_to_many(:destinations) }
  end

  describe 'Validations' do
    let(:category2) { create(:category) }

    it 'has a name' do
      category.name = nil
      expect(category).to be_invalid
    end

    it 'has a unique name' do
      category2.name = category.name
      expect(category2).to be_invalid
    end
  end
end
