FactoryGirl.define do
  factory :book do
  title "Gone Girl"
  author "Gillian Flynn"
  just_added false
  available false
  checkout_counter 0

  trait :invalid do
    title nil
  end

  trait :updated do
    title "Wrong Girl"
    author "Not Gillian"
  end
end

end
