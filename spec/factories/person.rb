FactoryGirl.define do
    factory :person, class: Person do
    name 'Bob'
    age 28
    hair_color 'brown'
    eye_color 'silver'
    gender 'male'
    alive true
    trait :missing do
      name nil
    end
    end
end

