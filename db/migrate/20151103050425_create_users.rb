class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email
      t.string :password_digest
      t.integer :status
      t.timestamps null: false
    end
  end
end
