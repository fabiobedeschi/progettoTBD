class ChangeDateOfPublicationToYear < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :dop
    add_column :books, :year, :integer
  end
end
