require 'spec_helper'

describe "bikers/index" do
  before(:each) do
    assign(:bikers, [
      stub_model(Biker,
        :first_name => "First Name",
        :last_name => "Last Name",
        :netid => "Netid",
        :email => "Email",
        :affiliation => "Affiliation",
        :year_of_graduation => 1
      ),
      stub_model(Biker,
        :first_name => "First Name",
        :last_name => "Last Name",
        :netid => "Netid",
        :email => "Email",
        :affiliation => "Affiliation",
        :year_of_graduation => 1
      )
    ])
  end

  it "renders a list of bikers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Netid".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Affiliation".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
