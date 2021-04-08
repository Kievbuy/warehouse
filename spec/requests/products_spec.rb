 require 'rails_helper'

RSpec.describe "/products", type: :request do
  let!(:destination) { create(:destination) }
  let(:reference) { create(:reference) }
  let(:category) { create(:category) }
  let(:valid_attributes) {
    {
      name: 'Product 1',
      price: 100,
      reference_id: reference.id,
      category_id: category.id,
      destination_id: destination.id
    }
  }

  let(:invalid_attributes) {
    {
      check: true
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Product.create! valid_attributes
      get products_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get product_url(product)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_product_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      product = Product.create! valid_attributes
      get edit_product_url(product)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Product" do
        expect {
          post products_url, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "creates a new Product and detect destination" do
        expect {
          post products_url, params: { product: valid_attributes.except(:destination_id) }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the products" do
        post products_url, params: { product: valid_attributes }
        expect(response).to redirect_to(products_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Product" do
        expect {
          post products_url, params: { product: invalid_attributes }
        }.to change(Product, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post products_url, params: { product: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: 'New name',
          price: 1000
        }
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(product.price).to eq new_attributes[:price]
        expect(product.name).to eq new_attributes[:name]
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(response).to redirect_to(product_url(product))
      end
    end

    context "with invalid parameters" do
      it "renders a unsuccessful response (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete product_url(product)
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete product_url(product)
      expect(response).to redirect_to(products_url)
    end
  end
end
