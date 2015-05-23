class BookCheckout < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def returned?
    Time.zone.now >= return_deadline
  end

  def save_and_verify
    # make sure book attributes are valid
    ActiveRecord::Base.transaction do
      save

      book.checkout_user_id = user.id
      book.available = false
      book.save

      user.books_read += 1
      user.save
    end
  end
end
