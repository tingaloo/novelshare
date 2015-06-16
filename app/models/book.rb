class Book < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :comments
  validates :title, presence: true, length: {minimum: 3}
  validates :author, presence: true

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  has_many :book_checkouts, dependent: :destroy
  has_attached_file :cover
  attr_reader :cover_remote_url

  def cover_remote_url(url_value)
    self.cover = URI.parse(url_value)
    @cover_remote_url = url_value
  end

  def available? # the presenter calls this
    if most_recent_checkout
      most_recent_checkout.returned?
    else
      true
    end
  end

  def children?
    comments.any?
  end

  def most_recent_checkout
    book_checkouts.order('return_deadline desc').first
  end


  private

  def destroy_book_checkouts
    BookCheckout.delete_all "book_id = #{id}"
  end
end
