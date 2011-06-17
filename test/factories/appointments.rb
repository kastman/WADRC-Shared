# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :appointment do |f|
  f.association :visit
  f.appointment_date DateTime.now.day
  f.appointment_comment "MyText"
  f.association :researcher
end