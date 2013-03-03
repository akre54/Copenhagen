require 'spec_helper'

describe "bikes/show" do
  before(:each) do
    @bike = assign(:bike, stub_model(Bike,
      :color => "Color",
      :condition => "MyText",
      :location => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Color/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end