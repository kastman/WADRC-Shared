# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :enrollment do |f|
  f.association :participant
  f.enroll_date "2011-03-28"
  f.enumber "MyString"
  f.recruitment_source "MyString"
  f.withdrawl_reason "MyText"
end