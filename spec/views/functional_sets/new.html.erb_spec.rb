require 'spec_helper'

describe "functional_sets/new.html.erb" do
  before(:each) do
    assign(:functional_set, stub_model(FunctionalSet,
      :setname => "MyString"
    ).as_new_record)
  end

  it "renders new functional_set form" do
    render

    rendered.should have_selector("form", :action => functional_sets_path, :method => "post") do |form|
      form.should have_selector("input#functional_set_setname", :name => "functional_set[setname]")
    end
  end
end
