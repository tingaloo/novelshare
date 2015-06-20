class Airdrop
  def initialize(params)
    @user = params.fetch(:user)
  end

  def save
    # get_new_book_from_goodreads
    # @book.cover_remote_url(goodreads.book_by_title(@book.title).image_url)

    @goodreadslist = GoodReadsList.new()
    @list = @goodreadslist.fetch_list
    find_author_and_title
        @book = @user.books.build(:title => @title, :author => @author
      )
    find_book_cover
    return @book.save
  end

  # def get_new_book_from_goodreads
  #   @stocks = []
  #   @rand = 1
  #   @doc = Nokogiri::HTML(open("https://www.goodreads.com/book/most_read"))

  #   @doc.css("tr td a span").each do |item|
  #     @stocks << item.text
  #   end
  # end

  def find_author_and_title
    # Loop checks for titles first
    @rand = 1
    while @rand.even? == false
      @rand = rand(0..@list.count-2)
    end

    @title = @list[@rand]
    @author = @list[@rand+1]

    # build book in controller phase?
    # @book = @user.books.build(:title => @title, :author => @author
    #   )

    # AIRDROP NEEDS TO CALL GOODREADS api,
  end

  def find_book_cover
    goodreads ||= Goodreads.new
    @goodreadsbookcover = goodreads.book_by_title(@book.title).image_url
    @book.cover_remote_url(@goodreadsbookcover)
  end

  # @list =
end
