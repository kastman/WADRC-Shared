# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :series_scenario do |f|
  f.description "T1"
  f.association :series_scenario_category
  f.association :series_set_category
end