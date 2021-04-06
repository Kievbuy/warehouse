require 'rails_helper'

RSpec.describe "destinations/index", type: :view do
  before(:each) do
    assign(:destinations, [
      Destination.create!(),
      Destination.create!()
    ])
  end

  it "renders a list of destinations" do
    render
  end
end
