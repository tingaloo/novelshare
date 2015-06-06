FactoryGirl.define do
  factory :user do
    name "First user"
    email "test@example.com"
    password "please123"

    trait :test_user do
      name "What?"
      email "John@john.com"
      password "unknoown"
    end
  end
end
