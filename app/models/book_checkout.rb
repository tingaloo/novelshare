class BookCheckout < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def returned?
    Time.zone.now >= return_deadline
  end
end
