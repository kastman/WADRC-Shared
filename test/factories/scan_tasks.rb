# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :scan_task do |f|
  f.association(:appointment)
  f.association(:functional_scenario)
  #f.scan_series
  f.series_order 1
  f.preday_order 1
  f.pfile "00001"
  f.has_concerns false
  f.concerns "None"
  f.functional_note "None"
end