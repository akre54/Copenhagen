require 'spec_helper'

describe "bikers/edit" do
  before(:each) do
    @biker = assign(:biker, stub_model(Biker,
      :first_name => "MyString",
      :last_name => "MyString",
      :netid => "MyString",
      :email => "MyString",
      :affiliation => "MyString",
      :year_of_graduation => 1
    ))
  end

  it "renders the edit biker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", biker_path(@biker), "post" do
      assert_select "input#biker_first_name[name=?]", "biker[first_name]"
      assert_select "input#biker_last_name[name=?]", "biker[last_name]"
      assert_select "input#biker_netid[name=?]", "biker[netid]"
      assert_select "input#biker_email[name=?]", "biker[email]"
      assert_select "input#biker_affiliation[name=?]", "biker[affiliation]"
      assert_select "input#biker_year_of_graduation[name=?]", "biker[year_of_graduation]"
    end
  end
end
