class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :users, index: true
      t.belongs_to :shops, index: true
      t.timestamps null: false
    end
  end
end
