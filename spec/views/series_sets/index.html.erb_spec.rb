require 'spec_helper'

describe "series_sets/index.html.erb" do
  before(:each) do
    assign(:series_sets, [Factory(:series_set), Factory(:series_set)])
  end

  it "renders a list of series_sets" do
    render
    rendered.should have_selector("tr>td")
  end
end
