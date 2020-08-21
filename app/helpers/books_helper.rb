module BooksHelper
  def string_date(date)
    "#{date.day}/#{date.month}/#{date.year}" unless date.nil?
  end
end
