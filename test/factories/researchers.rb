# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :researcher do |f|
  f.initials "abc"
  f.first "a"
  f.last "c"
end

Factory.define :study_scan_tech, :class => Researcher do |f|
  f.initials "abc"
  f.first "a"
  f.last "c"
end

Factory.define :diagnoser, :class => Researcher do |f|
  f.initials "abc"
  f.first "a"
  f.last "c"
end