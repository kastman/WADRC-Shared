require 'spec_helper'

describe "scan_tasks/show.html.erb" do
  before(:each) do
    @scan_task = assign(:scan_task, Factory(:scan_task,
      :series_order => 1,
      :preday_order => 1,
      :has_concerns => false,
      :concerns => "Concerns",
      :functional_note => "Functional Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(false.to_s)
    rendered.should contain("Concerns".to_s)
    rendered.should contain("Functional Note".to_s)
  end
end
