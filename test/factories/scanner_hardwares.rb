# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :scanner_hardware do |f|
  f.sequence(:name) {|n| "Goggles#{n}"}
  f.hardware_group "Eyewear"
end