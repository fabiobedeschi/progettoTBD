class AddNameAttributeToActors < ActiveRecord::Migration[6.0]
  def change
    remove_column :authors, :last_name
    rename_column :authors, :first_name, 'name'
  end
end
