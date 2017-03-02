class LotsOfStuff < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :user_id, :integer
    add_column :tags,  :name, :text
    add_column :users, :username, :string
  end
end
