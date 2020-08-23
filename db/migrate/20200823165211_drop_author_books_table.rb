class DropAuthorBooksTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :author_books
  end
end
