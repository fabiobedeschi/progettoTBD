module BooksHelper
  def string_dop(book)
    book.dop.nil? ? 'Unknown date of pubblication' : string_date(book.dop)
  end
end
