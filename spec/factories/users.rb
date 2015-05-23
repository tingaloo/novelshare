FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"
  end

  factory :user1 do
    name "Foo"
    email "bar"
    password "password"
  end
end
