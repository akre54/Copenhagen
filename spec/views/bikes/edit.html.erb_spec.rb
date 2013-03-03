require 'spec_helper'

describe "bikes/edit" do
  before(:each) do
    @bike = assign(:bike, stub_model(Bike,
      :color => "MyString",
      :condition => "MyText",
      :location => 1
    ))
  end

  it "renders the edit bike form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bike_path(@bike), "post" do
      assert_select "input#bike_color[name=?]", "bike[color]"
      assert_select "textarea#bike_condition[name=?]", "bike[condition]"
      assert_select "input#bike_location[name=?]", "bike[location]"
    end
  end
end
