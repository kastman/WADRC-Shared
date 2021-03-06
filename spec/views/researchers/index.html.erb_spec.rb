require 'spec_helper'

describe "researchers/index.html.erb" do
  before(:each) do
    assign(:researchers, [
      stub_model(Researcher,
        :initials => "Initials",
        :first => "First",
        :last => "Last"
      ),
      stub_model(Researcher,
        :initials => "Initials",
        :first => "First",
        :last => "Last"
      )
    ])
    assign(:search, Researcher.search)
  end

  it "renders a list of researchers" do
    render
    rendered.should have_selector("tr>td", :text => "Initials".to_s, :count => 2)
    rendered.should have_selector("tr>td", :text => "First".to_s, :count => 2)
    rendered.should have_selector("tr>td", :text => "Last".to_s, :count => 2)
  end
end
