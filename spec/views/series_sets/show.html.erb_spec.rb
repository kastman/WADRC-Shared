require 'spec_helper'

describe "series_sets/show.html.erb" do
  before(:each) do
    @series_set = assign(:series_set, stub_model(SeriesSet,
      :setname => "Setname"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("Setname".to_s)
  end
end
