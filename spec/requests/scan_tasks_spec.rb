require 'spec_helper'

describe "ScanTasks" do
  describe "GET /scan_tasks" do
    it "works! (now write some real specs)" do
      visit scan_tasks_path
      response.status.should be(200)
    end
  end
end
