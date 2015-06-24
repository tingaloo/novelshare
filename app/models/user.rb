class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  attr_accessor :login
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  has_many :books
  has_many :book_checkouts
  has_many :comments

  def donated_books
    Book.where(user_id: id)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_hash).first
      end
    end
end
