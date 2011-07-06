require 'spec_helper'

describe "series/new.html.erb" do
  before(:each) do
    assign(:series, Factory.build(:series,
      :position => 1,
      :pfile => 12345
    ))
  end

  it "renders new series form" do
    render

    rendered.should have_selector("form", :action => "/series", :method => "post") do |form|
      form.should have_selector("select#series_appointment_id", :name => "series[appointment_id]")
      form.should have_selector("input#series_position", :name => "series[position]")
      form.should have_selector("input#series_pfile", :name => "series[pfile]")
    end
  end
end
