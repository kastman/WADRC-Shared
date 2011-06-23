require 'spec_helper'

describe "Series" do
  describe "GET /series" do
    it "works! (now write some real specs)" do
      visit series_index_path
      response.status.should be(200)
    end
  end
end
