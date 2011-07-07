require 'spec_helper'

describe "appointments/show.html.erb" do
  before(:each) do
    @appointment = assign(:appointment, Factory(:appointment))
    @series = assign(:series, @appointment.series)
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content(nil.to_s)
    rendered.should have_content("MyText".to_s)
    rendered.should have_content(nil.to_s)
  end
end
