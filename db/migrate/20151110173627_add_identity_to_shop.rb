class AddIdentityToShop < ActiveRecord::Migration
  def change
    add_column :shops, :identity, :string
  end
end
