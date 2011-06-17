require 'spec_helper'

describe "visits/index.html.erb" do
  before(:each) do
    assign(:visits, [ 
      Factory(:visit, 
        :visit_number => 5, 
        :scan_note => "MyText"), 
      Factory(:visit, 
        :visit_number => 3, 
        :scan_note => "MyText")
    ])
    #   stub_model(Visit,
    #     :cognitive_status => 1,
    #     :visit_number => 1,
    #     :scan_note => "MyText"
    #   ),
    #   stub_model(Visit,
    #     :cognitive_status => 1,
    #     :visit_number => 1,
    #     :scan_note => "MyText"
    #   )
    # ])
    assign(:search, Visit.search)
  end

  it "renders a list of visits" do
    render
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
