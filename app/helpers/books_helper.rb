module BooksHelper
  def string_year(book)
    book.year.nil? ? 'Unknown year of publication' : book.year.to_s
  end
end
