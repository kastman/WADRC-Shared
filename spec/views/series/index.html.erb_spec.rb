require 'spec_helper'

describe "series/index.html.erb" do
  before(:each) do
    assign(:series, [
      Factory(:series,
        :position => 1,
        :pfile => 12345
      ),
      Factory(:series,
        :position => 1,
        :pfile => 12345
      )
    ])
  end

  it "renders a list of series" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s)
    rendered.should have_selector("tr>td", :content => 12345.to_s, :count => 2)
  end
end
