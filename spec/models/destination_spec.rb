require 'rails_helper'

RSpec.describe Destination, type: :model do
  let(:categories) { create_list(:category, 2) }
  let(:references) { create_list(:reference, 2) }

  let(:destination) { create(:destination, categories: categories, references: references) }

  it 'has a valid factory' do
    expect( build(:destination) ).to be_valid
  end

  describe "empty new object" do
    it "must not be valid" do
      new_destination = described_class.new
      expect(new_destination).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:products) }
    it { should have_and_belong_to_many(:references) }
    it { should have_and_belong_to_many(:categories) }
  end

  describe 'Validations' do
    let(:destination2) { create(:destination) }

    it 'has a name' do
      destination.name = nil
      expect(destination).to be_invalid
    end

    it 'has a unique name' do
      destination2.name = destination.name
      expect(destination2).to be_invalid
    end
  end
end
