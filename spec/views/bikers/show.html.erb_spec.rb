require 'spec_helper'

describe "bikers/show" do
  before(:each) do
    @biker = assign(:biker, stub_model(Biker,
      :first_name => "First Name",
      :last_name => "Last Name",
      :netid => "Netid",
      :email => "Email",
      :affiliation => "Affiliation",
      :year_of_graduation => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Netid/)
    rendered.should match(/Email/)
    rendered.should match(/Affiliation/)
    rendered.should match(/1/)
  end
end
