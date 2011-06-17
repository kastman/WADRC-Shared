# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :functional_scenario do |f|
  f.description "T1"
  f.association(:functional_set)
  f.intended_reps 1
  f.scenario_file "MyString.sce"
end