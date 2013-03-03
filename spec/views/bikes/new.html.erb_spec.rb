require 'spec_helper'

describe "bikes/new" do
  before(:each) do
    assign(:bike, stub_model(Bike,
      :color => "MyString",
      :condition => "MyText",
      :location => 1
    ).as_new_record)
  end

  it "renders new bike form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bikes_path, "post" do
      assert_select "input#bike_color[name=?]", "bike[color]"
      assert_select "textarea#bike_condition[name=?]", "bike[condition]"
      assert_select "input#bike_location[name=?]", "bike[location]"
    end
  end
end
