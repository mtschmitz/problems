FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar11"
    password_confirmation "foobar11"

  end
  factory :problem do
    sequence(:name)  { |n| "problem #{n}"}
    sequence(:description)  { |n| "YEAH HAHAHAHA"}
    user
    
  end
  
end