Factory.define :visit do |f|
  f.visit_number 1
end

Factory.define :visit_with_enrollments, :parent => :visit do |visit|
  visit.after_create {|v| Factory(:enrollment, :visits => [v])}
end