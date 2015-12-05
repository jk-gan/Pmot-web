class CreateDevices < ActiveRecord::Migration

  def change
    create_table :devices do |t|
      t.belongs_to :user, index: true
      t.string :token
      t.boolean :enabled
      t.string :platform
      t.timestamps null: false
    end
  end
end
