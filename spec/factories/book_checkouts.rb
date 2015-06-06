FactoryGirl.define do
  factory :book_checkout do
      book_id  1
      user_id  1
      return_deadline Time.zone.now + 2.weeks
  end

end
