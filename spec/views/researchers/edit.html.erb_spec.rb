require 'spec_helper'

describe "researchers/edit.html.erb" do
  before(:each) do
    @researcher = assign(:researcher, stub_model(Researcher,
      :initials => "MyString",
      :first => "MyString",
      :last => "MyString"
    ))
  end

  it "renders the edit researcher form" do
    render

    rendered.should have_selector("form", :action => researcher_path(@researcher), :method => "post") do |form|
      form.should have_selector("input#researcher_initials", :name => "researcher[initials]")
      form.should have_selector("input#researcher_first", :name => "researcher[first]")
      form.should have_selector("input#researcher_last", :name => "researcher[last]")
    end
  end
end
