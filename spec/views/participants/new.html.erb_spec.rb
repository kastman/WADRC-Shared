require 'spec_helper'

describe "participants/new.html.erb" do
  before(:each) do
    assign(:participant, stub_model(Participant,
      :initials => "MyString",
      :wrapnum => "MyString",
      :reggieid => 1,
      :notes => "MyText",
      :quality_redflag => false
    ).as_new_record)
  end

  it "renders new participant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => participants_path, :method => "post" do
      assert_select "input#participant_initials", :name => "participant[initials]"
      assert_select "input#participant_wrapnum", :name => "participant[wrapnum]"
      assert_select "input#participant_reggieid", :name => "participant[reggieid]"
      assert_select "textarea#participant_notes", :name => "participant[notes]"
      assert_select "input#participant_quality_redflag", :name => "participant[quality_redflag]"
    end
  end
end
