# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :series_set do |f|
  f.association :appointment
  f.association :series_set_category
end