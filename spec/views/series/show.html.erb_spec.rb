require 'spec_helper'

describe "series/show.html.erb" do
  before(:each) do
    @series = assign(:series, Factory(:series))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
  end
end
