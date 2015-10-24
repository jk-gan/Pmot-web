class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :address
      t.belongs_to :owner, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
