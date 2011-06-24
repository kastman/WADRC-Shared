require 'spec_helper'

describe "series_sets/new.html.erb" do
  before(:each) do
    assign(:series_set, stub_model(SeriesSet,
      :setname => "MyString"
    ).as_new_record)
  end

  it "renders new series_set form" do
    render

    rendered.should have_selector("form", :action => series_sets_path, :method => "post") do |form|
      form.should have_selector("input#series_set_setname", :name => "series_set[setname]")
    end
  end
end
