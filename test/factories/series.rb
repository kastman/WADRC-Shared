# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :series do |f|
  f.association(:series_set)
  f.position 1
  f.pfile 12345
end