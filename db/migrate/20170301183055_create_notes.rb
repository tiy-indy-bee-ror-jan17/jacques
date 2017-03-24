class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string   :title
      t.text     :body
      t.integer  :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
