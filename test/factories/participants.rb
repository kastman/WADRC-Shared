Factory.define :participant do |f|
  f.initials 'abc'
  f.sequence(:reggieid) {|n| "reggie0000#{n}"}
  f.association :demographic
  
  #f.association :enrollments, :factory => :enrollment
end
