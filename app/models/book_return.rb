class BookReturn < ActiveRecord::Base
    before_action :authenticate_user!

  belongs_to :user
  belongs_to :book
  def new

  end
end
