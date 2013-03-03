require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :name => "MyString",
      :lat => 1.5,
      :long => 1.5
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_name[name=?]", "location[name]"
      assert_select "input#location_lat[name=?]", "location[lat]"
      assert_select "input#location_long[name=?]", "location[long]"
    end
  end
end
