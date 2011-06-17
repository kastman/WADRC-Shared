require 'spec_helper'

describe "visits/new.html.erb" do
  before(:each) do
    assign(:visit, stub_model(Visit,
      :cognitive_status => 1,
      :visit_number => 1,
      :scan_note => "MyText"
    ).as_new_record)
  end

  it "renders new visit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => visits_path, :method => "post" do
      assert_select "input#visit_visit_number", :name => "visit[visit_number]"
      assert_select "textarea#visit_scan_note", :name => "visit[scan_note]"
    end
  end
end
