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
    rendered.should contain("Initials".to_s)
    rendered.should contain("First".to_s)
    rendered.should contain("Last".to_s)
  end
end
