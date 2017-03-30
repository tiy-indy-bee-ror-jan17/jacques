class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :token
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
