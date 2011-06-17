require 'spec_helper'

describe "visits/edit.html.erb" do
  before(:each) do
    @visit = assign(:visit, stub_model(Visit,
      :cognitive_status => 1,
      :visit_number => 1,
      :scan_note => "MyText"
    ))
  end

  it "renders the edit visit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => visits_path(@visit), :method => "post" do
      assert_select "input#visit_visit_number", :name => "visit[visit_number]"
      assert_select "textarea#visit_scan_note", :name => "visit[scan_note]"
    end
  end
end
