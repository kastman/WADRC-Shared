# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :appointment do |f|
  f.association(:visit)
  f.association(:researcher)
  f.appointment_date Date.today
  f.appointment_comment "MyText"
end

Factory.define :appointment_with_enrollments, :parent => :appointment do |appointment|
  appointment.after_create {|a| Factory(:visit_with_enrollments, :appointment => a)}
end