require 'spec_helper'

describe "functional_sets/edit.html.erb" do
  before(:each) do
    @functional_set = assign(:functional_set, stub_model(FunctionalSet,
      :setname => "MyString"
    ))
  end

  it "renders the edit functional_set form" do
    render

    rendered.should have_selector("form", :action => functional_set_path(@functional_set), :method => "post") do |form|
      form.should have_selector("input#functional_set_setname", :name => "functional_set[setname]")
    end
  end
end
