require 'rails_helper'

RSpec.describe Product::DestinationAssignment, type: :model do
  describe '#call' do
    let!(:default_destination) { create(:destination, max_price: nil) }

    describe 'basic assignment' do
      let!(:product) { create(:product) }

      it 'have to assign product to destination' do
        product.destination = Product::DestinationAssignment.call(product, default_destination)
        expect(product.destination).not_to eq nil
      end
    end

    describe 'assignment by category' do
      let!(:category) { create(:category) }
      let!(:product) { build(:product, category: category, destination_id: nil) }
      let!(:destination) { create(:destination, categories: [category]) }

      it 'have to be assigned to the destination with the same category' do 
        product.destination = Product::DestinationAssignment.call(product, default_destination)
        expect(product.destination).to eq destination
      end
    end

    describe 'assignment by reference' do
      let!(:reference) { create(:reference) }
      let!(:product) { build(:product, reference: reference, destination_id: nil) }
      let!(:destination) { create(:destination, references: [reference]) }

      it 'have to be assigned to the destination with the same reference' do 
        product.destination = Product::DestinationAssignment.call(product, default_destination)
        expect(product.destination).to eq destination
      end
    end

    describe 'assignment by max_price' do
      let!(:product) { build(:product, price: 50, destination_id: nil) }

      let!(:destination) { create(:destination, max_price: 100) }
      let!(:other_destination) { create(:destination, max_price: 40) }

      it 'have to be assigned to the destination by price' do 
        product.destination = Product::DestinationAssignment.call(product, default_destination)
        expect(product.destination).to eq destination
      end
    end

    describe 'assignment by number of criteries' do
      let!(:reference) { create(:reference) }
      let!(:category) { create(:category) }

      let!(:product) { build(:product, reference: reference, category: category, destination_id: nil) }

      let!(:destination) { create(:destination, references: [reference], categories: [category]) }
      let!(:other_destination) { create(:destination, references: [reference]) }

      it 'have to be assigned to the destination high priority' do 
        product.destination = Product::DestinationAssignment.call(product, default_destination)
        expect(product.destination).to eq destination
      end
    end
  end
end