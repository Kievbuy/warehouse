require 'rails_helper'

RSpec.describe Reference, type: :model do
  let(:reference) { create(:reference) }

  it 'has a valid factory' do
    expect( build(:reference) ).to be_valid
  end

  describe "empty new object" do
    it "must not be valid" do
      new_reference = described_class.new
      expect(new_reference).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:products) }
    it { should have_and_belong_to_many(:destinations) }
  end

  describe 'Validations' do
    let(:reference2) { create(:reference) }

    it 'has a name' do
      reference.name = nil
      expect(reference).to be_invalid
    end

    it 'has a unique name' do
      reference2.name = reference.name
      expect(reference2).to be_invalid
    end
  end
end
