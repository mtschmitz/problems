FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar11"
    password_confirmation "foobar11"

  end

  factory :problem do
    name "This is a test problem."
    description "This is a description"
    user
  end
end

