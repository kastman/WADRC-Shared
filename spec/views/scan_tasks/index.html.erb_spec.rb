require 'spec_helper'

describe "scan_tasks/index.html.erb" do
  before(:each) do
    assign(:scan_tasks, [
      Factory(:scan_task,
        :series_order => 1,
        :preday_order => 2,
        :has_concerns => false,
        :concerns => "Concerns",
        :functional_note => "Functional Note"
      ),
      Factory(:scan_task,
        :series_order => 3,
        :preday_order => 4,
        :has_concerns => false,
        :concerns => "Concerns",
        :functional_note => "Functional Note"
      )
    ])
  end

  it "renders a list of scan_tasks" do
    render
    # rendered.should have_selector("td", :content => 1.to_s)
    # rendered.should have_selector("tr>td", :content => 2.to_s, :count => 1)
    # rendered.should have_selector("tr>td", :content => 3.to_s, :count => 1)
    # rendered.should have_selector("tr>td", :content => 4.to_s, :count => 1)
    rendered.should have_selector("tr>td", :content => "00001".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Concerns".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Functional Note".to_s, :count => 2)
  end
end
