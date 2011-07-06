require 'spec_helper'

describe "series/edit.html.erb" do
  before(:each) do
    @series = assign(:series, stub_model(Series,
      :appointment => nil,
      :position => 1,
      :pfile => 1
    ))
  end

  it "renders the edit series form" do
    render

    rendered.should have_selector("form", :action => series_path(@series), :method => "post") do |form|
      form.should have_selector("select#series_appointment_id", :name => "series[appointment_id]")
      form.should have_selector("input#series_position", :name => "series[position]")
      form.should have_selector("input#series_pfile", :name => "series[pfile]")
    end
  end
end
