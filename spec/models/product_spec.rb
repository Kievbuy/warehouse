require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) }

  it 'has a valid factory' do
    expect( build(:product) ).to be_valid
  end

  describe "empty new object" do
    it "must not be valid" do
      new_product = described_class.new
      expect(new_product).to be_invalid
    end
  end

  describe 'Associations' do
    it { should belong_to(:destination) }
    it { should belong_to(:reference) }
    it { should belong_to(:category) }
  end

  describe 'Validations' do
    let(:product2) { create(:product) }

    it 'has a name' do
      product.name = nil
      expect(product).to be_invalid
    end

    it 'has a unique name' do
      product2.name = product.name
      expect(product2).to be_invalid
    end
  end
end
