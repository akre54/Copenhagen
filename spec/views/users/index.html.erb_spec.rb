require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :netid => "",
        :first_name => "",
        :last_name => "",
        :year_of_graduation => "",
        :email_address => "",
        :type => "Type"
      ),
      stub_model(User,
        :netid => "",
        :first_name => "",
        :last_name => "",
        :year_of_graduation => "",
        :email_address => "",
        :type => "Type"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
