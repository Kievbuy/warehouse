 require 'rails_helper'

RSpec.describe "/references", type: :request do
  
  let(:valid_attributes) {
    {
      name: 'Reference 1'
    }
  }

  let(:invalid_attributes) {
    {
      invalid: true
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Reference.create! valid_attributes
      get references_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      reference = Reference.create! valid_attributes
      get reference_url(reference)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_reference_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      reference = Reference.create! valid_attributes
      get edit_reference_url(reference)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Reference" do
        expect {
          post references_url, params: { reference: valid_attributes }
        }.to change(Reference, :count).by(1)
      end

      it "redirects to the references" do
        post references_url, params: { reference: valid_attributes }
        expect(response).to redirect_to(references_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Reference" do
        expect {
          post references_url, params: { reference: invalid_attributes }
        }.to change(Reference, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post references_url, params: { reference: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: 'New name'
        }
      }

      it "updates the requested reference" do
        reference = Reference.create! valid_attributes
        patch reference_url(reference), params: { reference: new_attributes }
        reference.reload
        expect(reference.name).to eq new_attributes[:name]
      end

      it "redirects to the reference" do
        reference = Reference.create! valid_attributes
        patch reference_url(reference), params: { reference: new_attributes }
        reference.reload
        expect(response).to redirect_to(reference_url(reference))
      end
    end

    context "with invalid parameters" do
      it "renders a unsuccessful response (i.e. to display the 'edit' template)" do
        reference = Reference.create! valid_attributes
        patch reference_url(reference), params: { reference: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested reference" do
      reference = Reference.create! valid_attributes
      expect {
        delete reference_url(reference)
      }.to change(Reference, :count).by(-1)
    end

    it "redirects to the references list" do
      reference = Reference.create! valid_attributes
      delete reference_url(reference)
      expect(response).to redirect_to(references_url)
    end
  end
end
