require 'spec_helper'

describe "visits/show.html.erb" do
  before(:each) do
    @visit = assign(:visit, stub_model(Visit,
      :cognitive_status => 1,
      :visit_number => 1,
      :scan_note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
