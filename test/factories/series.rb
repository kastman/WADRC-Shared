# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :series do |f|
  f.association(:appointment)
  f.association(:series_set)
  f.order 1
  f.pfile 12345
end