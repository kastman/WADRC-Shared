class FunctionalSet < ActiveRecord::Base
  TASK_FUNCTIONAL_SET_IDS = [
      FunctionalSet.find_by_setname("In-Scan Task"),
      FunctionalSet.find_by_setname("Pre"),
      FunctionalSet.find_by_setname("Post")
  ].reject(&:blank?).map(&:id)
  
  
  has_many :functional_scenarios
end
