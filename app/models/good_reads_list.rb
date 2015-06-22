class GoodReadsList

  def initialize()

  end

  def fetch_list
    @list = []

    @doc = Nokogiri::HTML(open("https://www.goodreads.com/book/most_read"))

    @doc.css("tr td a span").each do |item|
      @list << item.text
    end

    @list
  end

end
