require 'spec_helper'

describe "researchers/new.html.erb" do
  before(:each) do
    assign(:researcher, stub_model(Researcher,
      :initials => "MyString",
      :first => "MyString",
      :last => "MyString"
    ).as_new_record)
  end

  it "renders new researcher form" do
    render

    rendered.should have_selector("form", :action => researchers_path, :method => "post") do |form|
      form.should have_selector("input#researcher_initials", :name => "researcher[initials]")
      form.should have_selector("input#researcher_first", :name => "researcher[first]")
      form.should have_selector("input#researcher_last", :name => "researcher[last]")
    end
  end
end
