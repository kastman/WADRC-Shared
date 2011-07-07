require 'spec_helper'

describe "enrollments/show.html.erb" do
  before(:each) do
    @enrollment = assign(:enrollment, stub_model(Enrollment,
      :participant => nil,
      :enumber => "Enumber",
      :recruitment_source => "Recruitment Source",
      :withdrawl_reason => "MyText"
    ))
    @visits = assign(:visits, [Factory(:visit)])
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content(nil.to_s)
    rendered.should have_content("Enumber".to_s)
    rendered.should have_content("Recruitment Source".to_s)
    rendered.should have_content("MyText".to_s)
  end
end
