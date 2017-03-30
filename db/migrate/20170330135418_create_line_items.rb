class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.references :cart, foreign_key: true
      t.references :note, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
