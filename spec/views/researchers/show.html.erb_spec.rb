require 'spec_helper'

describe "researchers/show.html.erb" do
  before(:each) do
    @researcher = assign(:researcher, stub_model(Researcher,
      :initials => "Initials",
      :first => "First",
      :last => "Last"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("Initials".to_s)
    rendered.should have_content("First".to_s)
    rendered.should have_content("Last".to_s)
  end
end
