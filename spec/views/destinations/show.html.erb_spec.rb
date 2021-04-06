require 'rails_helper'

RSpec.describe "destinations/show", type: :view do
  before(:each) do
    @destination = assign(:destination, Destination.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
