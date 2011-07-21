# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
[ "Healthy Control", "Mild MCI", "Medium MCI", "Severe MCI", "Mild AD", 
"Medium AD", "Severe AD", "TBI"].each do |characterization|
  Diagnosis.find_or_create_by_characterization(characterization)
end

["Consensus Meeting","Clinician Dx"].each do |consensus_method|
  DiagnosisMethod.find_or_create_by_consensus_method(consensus_method)
end

# Task or Pulse (Used for Task or Pulse witin-table polymorphic)
%W{task pulse}.each do |category_name|
  SeriesScenarioCategory.find_or_create_by_category_name(category_name)
end

%W{pfile sequence pre-task post-task}.each do |setname|
  SeriesSetCategory.find_or_create_by_setname(setname)
end
