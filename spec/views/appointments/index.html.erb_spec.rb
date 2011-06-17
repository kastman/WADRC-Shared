require 'spec_helper'

describe "appointments/index.html.erb" do
  before(:each) do
    assign(:appointments, [Factory(:appointment), Factory(:appointment)])
    #   stub_model(Appointment,
    #     :visit => nil,
    #     :appointment_comment => "MyText",
    #     :researcher => nil
    #   ),
    #   stub_model(Appointment,
    #     :visit => nil,
    #     :appointment_comment => "MyText",
    #     :researcher => nil
    #   )
    # ])
  end

  it "renders a list of appointments" do
    render
    rendered.should have_selector("tr>td", :content => DateTime.now.day.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "abc".to_s, :count => 2)
  end
end
