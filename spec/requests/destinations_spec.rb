 require 'rails_helper'

RSpec.describe "/destinations", type: :request do
  
  let(:valid_attributes) {
    {
      name: 'Destination 1',
      max_price: 500
    }
  }

  let(:invalid_attributes) {
    {
      velocity: 60
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Destination.create! valid_attributes
      get destinations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      destination = Destination.create! valid_attributes
      get destination_url(destination)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_destination_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      destination = Destination.create! valid_attributes
      get edit_destination_url(destination)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Destination" do
        expect {
          post destinations_url, params: { destination: valid_attributes }
        }.to change(Destination, :count).by(1)
      end

      it "redirects to the destinations" do
        post destinations_url, params: { destination: valid_attributes }
        expect(response).to redirect_to(destinations_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Destination" do
        expect {
          post destinations_url, params: { destination: invalid_attributes }
        }.to change(Destination, :count).by(0)
      end

      it "renders a unsuccessful response (i.e. to display the 'new' template)" do
        post destinations_url, params: { destination: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: 'New name',
          max_price: 450
        }
      }

      it "updates the requested destination" do
        destination = Destination.create! valid_attributes
        patch destination_url(destination), params: { destination: new_attributes }
        destination.reload
        expect(destination.name).to eq new_attributes[:name]
        expect(destination.max_price).to eq new_attributes[:max_price]
      end

      it "redirects to the destination" do
        destination = Destination.create! valid_attributes
        patch destination_url(destination), params: { destination: new_attributes }
        destination.reload
        expect(response).to redirect_to(destination_url(destination))
      end
    end

    context "with invalid parameters" do
      it "renders a unsuccessful response (i.e. to display the 'edit' template)" do
        destination = Destination.create! valid_attributes
        patch destination_url(destination), params: { destination: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested destination" do
      destination = Destination.create! valid_attributes
      expect {
        delete destination_url(destination)
      }.to change(Destination, :count).by(-1)
    end

    it "redirects to the destinations list" do
      destination = Destination.create! valid_attributes
      delete destination_url(destination)
      expect(response).to redirect_to(destinations_url)
    end
  end
end
