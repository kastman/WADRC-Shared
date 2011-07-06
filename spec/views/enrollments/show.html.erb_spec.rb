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
    rendered.should contain(nil.to_s)
    rendered.should contain("Enumber".to_s)
    rendered.should contain("Recruitment Source".to_s)
    rendered.should contain("MyText".to_s)
  end
end
