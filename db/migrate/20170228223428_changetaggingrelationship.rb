class Changetaggingrelationship < ActiveRecord::Migration[5.0]
  def change
    remove_column :taggings, :user_id
    add_column :taggings, :note_id, :integer
  end
end
