# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :demographic do |f|
  f.dob "2011-03-28"
  f.education 1
  f.handedness 1
  f.association :race
  f.sex 'm'
end