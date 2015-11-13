class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.text :name
      t.text :description
      t.text :term_and_condition
      t.datetime :starts_at
      t.datetime :expires_at
      t.belongs_to :shop, index: true

      t.timestamps null: false
    end
  end
end
