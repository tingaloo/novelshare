class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessor :login
  # validates_uniqueness_of :username, :cast_sensitive => false

  has_many :books
  has_many :book_checkouts
  has_many :comments

  def donated_books
    Book.where(user_id: id)
  end

  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end
end
