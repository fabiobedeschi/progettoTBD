class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :plot
      t.date :dop

      t.timestamps
    end
  end
end
