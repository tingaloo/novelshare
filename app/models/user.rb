class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
        # removed :validatable

  has_many :books
  has_many :book_checkouts

  def donated_books
    Book.where(user_id: id)
  end
end
