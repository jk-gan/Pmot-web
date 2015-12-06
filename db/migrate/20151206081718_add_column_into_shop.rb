class AddColumnIntoShop < ActiveRecord::Migration
  def change
    add_column :shops, :phone, :string
    add_column :shops, :description, :text
  end
end
