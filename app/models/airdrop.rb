class Airdrop
  def initialize(params)
    @user = params.fetch(:user)
  end

  def save
    @goodreadslist = GoodReadsList.new()
    @list = @goodreadslist.fetch_list
    find_author_and_title
        @book = @user.books.build(:title => @title, :author => @author
      )
    find_book_cover
    return @book.save
  end

  def find_author_and_title
    @rand = 1
    while @rand.even? == false
      @rand = rand(0..@list.count-2)
    end

    @title = @list[@rand]
    @author = @list[@rand+1]

  end

  def find_book_cover
    goodreads ||= Goodreads.new
    @goodreadsbookcover = goodreads.book_by_title(@book.title).image_url
    @book.book_cover_url = @goodreadsbookcover
    @book.cover_remote_url(@goodreadsbookcover)
  end

end
