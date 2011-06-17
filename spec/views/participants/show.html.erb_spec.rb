require 'spec_helper'

describe "participants/show.html.erb" do
  before(:each) do
    @demographic = Factory.build(:demographic)
    @participant = assign(:participant, Factory(:participant, :demographic => @demographic, :notes => "MyText", :quality_redflag => false))
    # 
    # @participant = assign(:participant, stub_model(Participant,
    #   :initials => "Initials",
    #   :wrapnum => "Wrapnum",
    #   :reggieid => 1,
    #   :notes => "MyText",
    #   :quality_redflag => false
    # ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Initials/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Wrapnum/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
