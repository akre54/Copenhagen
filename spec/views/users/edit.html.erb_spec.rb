require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :netid => "",
      :first_name => "",
      :last_name => "",
      :year_of_graduation => "",
      :email_address => "",
      :type => ""
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_netid[name=?]", "user[netid]"
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_year_of_graduation[name=?]", "user[year_of_graduation]"
      assert_select "input#user_email_address[name=?]", "user[email_address]"
      assert_select "input#user_type[name=?]", "user[type]"
    end
  end
end
