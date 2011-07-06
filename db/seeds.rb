# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
diagnoses = Diagnosis.create([
  {:characterization => "Healthy Control"}, 
  {:characterization => "Mild MCI"},
  {:characterization => "Medium MCI"},
  {:characterization => "Severe MCI"},
  {:characterization => "Mild AD"},
  {:characterization => "Medium AD"},
  {:characterization => "Severe AD"}, 
  {:characterization => "TBI"}
])

diagnosis_methods = DiagnosisMethod.create([
  {:consensus_method => "Consensus Meeting"},
  {:consensus_method => "Clinician Dx"}
])

# SeriesSet seeds are created in find_or_create_by in Model Constants
series_sets = SeriesSet.create([
  {:setname => "pfile"}, 
  {:setname => "sequence"}, 
  {:setname => "computer-task"}
#   {:setname => "post"}
])