require 'spec_helper'

describe "series_sets/show.html.erb" do
  before(:each) do
    @series_set = assign(:series_set, Factory(:series_set))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("Setname".to_s)
  end
end
