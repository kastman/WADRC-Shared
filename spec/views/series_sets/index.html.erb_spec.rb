require 'spec_helper'

describe "series_sets/index.html.erb" do
  before(:each) do
    assign(:series_sets, [
      stub_model(SeriesSet,
        :setname => "Setname"
      ),
      stub_model(SeriesSet,
        :setname => "Setname"
      )
    ])
  end

  it "renders a list of series_sets" do
    render
    rendered.should have_selector("tr>td", :content => "Setname".to_s, :count => 2)
  end
end
