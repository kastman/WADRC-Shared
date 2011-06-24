require 'spec_helper'

describe "series_sets/edit.html.erb" do
  before(:each) do
    @series_set = assign(:series_set, stub_model(SeriesSet,
      :setname => "MyString"
    ))
  end

  it "renders the edit series_set form" do
    render

    rendered.should have_selector("form", :action => series_set_path(@series_set), :method => "post") do |form|
      form.should have_selector("input#series_set_setname", :name => "series_set[setname]")
    end
  end
end
