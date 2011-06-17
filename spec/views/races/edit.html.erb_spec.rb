require 'spec_helper'

describe "races/edit.html.erb" do
  before(:each) do
    @race = assign(:race, stub_model(Race,
      :name => "MyString"
    ))
  end

  it "renders the edit race form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => races_path(@race), :method => "post" do
      assert_select "input#race_name", :name => "race[name]"
    end
  end
end
