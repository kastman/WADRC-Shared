require 'spec_helper'

describe "functional_sets/show.html.erb" do
  before(:each) do
    @functional_set = assign(:functional_set, stub_model(FunctionalSet,
      :setname => "Setname"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("Setname".to_s)
  end
end
