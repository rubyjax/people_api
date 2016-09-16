FactoryGirl.define do
  factory :person do |p|
    p.first_name { FFaker::Name.first_name }
    p.last_name { FFaker::Name.last_name }
    p.email  { FFaker::Internet.email }
  end
end
