class CreateJoinTableAuthorLibrary < ActiveRecord::Migration[6.0]
  def change
    create_join_table :authors, :libraries do |t|
      t.index [:author_id, :library_id]
      t.index [:library_id, :author_id]
    end
  end
end
