require 'spec_helper'

describe "races/index.html.erb" do
  before(:each) do
    assign(:races, [
      stub_model(Race,
        :name => "Name"
      ),
      stub_model(Race,
        :name => "Name"
      )
    ])
  end

  it "renders a list of races" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
