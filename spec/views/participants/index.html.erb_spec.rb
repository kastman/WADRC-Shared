require 'spec_helper'

describe "participants/index.html.erb" do
  before(:each) do
    assign(:participants, [
      stub_model(Participant,
        :initials => "Initials",
        :wrapnum => "Wrapnum",
        :reggieid => 1,
        :notes => "MyText",
        :quality_redflag => false
      ),
      stub_model(Participant,
        :initials => "Initials",
        :wrapnum => "Wrapnum",
        :reggieid => 1,
        :notes => "MyText",
        :quality_redflag => false
      )
    ])
    assign(:search, Participant.search)
  end

  it "renders a list of participants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Initials".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Wrapnum".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
