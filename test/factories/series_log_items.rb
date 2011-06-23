# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :series_log_item do |f|
  f.association(:series)
  f.association(:functional_scenario)
  f.logfile "MyString"
  f.has_concerns false
  f.comment "MyString"
end