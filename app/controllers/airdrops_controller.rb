class AirdropsController < ApplicationController

  def get_new_book_from_goodreads
    @stocks = []
    @rand = 1
    @doc = Nokogiri::HTML(open("https://www.goodreads.com/book/most_read"))

    @doc.css("tr td a span").each do |item|
      @stocks << item.text
    end

    # Loop checks for titles first
    while @rand.even? == false
      @rand = rand(0..@stocks.count-2)
    end

    @title = @stocks[@rand]
    @author = @stocks[@rand+1]

    # build book in controller phase?
    @book = @user.books.build(:title => @title, :author => @author
      )

  end
end
