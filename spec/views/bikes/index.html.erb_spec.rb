require 'spec_helper'

describe "bikes/index" do
  before(:each) do
    assign(:bikes, [
      stub_model(Bike,
        :color => "Color",
        :condition => "MyText",
        :location => 1
      ),
      stub_model(Bike,
        :color => "Color",
        :condition => "MyText",
        :location => 1
      )
    ])
  end

  it "renders a list of bikes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
