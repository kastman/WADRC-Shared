require 'spec_helper'

describe "enrollments/index.html.erb" do
  before(:each) do
    @demographic = Factory.build(:demographic)
    assign(:enrollments, [
      stub_model(Enrollment,
        :participant => Factory(:participant, 
          :initials => "abc", 
          :demographic => @demographic,
          :reggieid => 1),
        :enumber => "Enumber",
        :recruitment_source => "Recruitment Source",
        :withdrawl_reason => "MyText"
      ),
      stub_model(Enrollment,
        :participant => Factory(:participant, 
          :initials => "abc", 
          :demographic => @demographic,
          :reggieid => 2),
        :enumber => "Enumber",
        :recruitment_source => "Recruitment Source",
        :withdrawl_reason => "MyText"
      )
    ])
    assign(:search, Enrollment.search)
  end

  it "renders a list of enrollments" do
    render
    rendered.should have_selector("tr>td", :text => "1".to_s, :count => 1)
    rendered.should have_selector("tr>td", :text => "2".to_s, :count => 1)
    rendered.should have_selector("tr>td", :text => "abc".to_s, :count => 2)
    rendered.should have_selector("tr>td", :text => "Enumber".to_s, :count => 2)
    rendered.should have_selector("tr>td", :text => "Recruitment Source".to_s, :count => 2)
    rendered.should have_selector("tr>td", :text => "MyText".to_s, :count => 2)
  end
end
