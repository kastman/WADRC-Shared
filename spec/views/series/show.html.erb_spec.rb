require 'spec_helper'

describe "series/show.html.erb" do
  before(:each) do
    @series = assign(:series, Factory(:series))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content(1.to_s)
  end
end
