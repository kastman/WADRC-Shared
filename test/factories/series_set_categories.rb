# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :series_set_category do |f|
  f.sequence(:setname) {|n| "set#{n}"}
end