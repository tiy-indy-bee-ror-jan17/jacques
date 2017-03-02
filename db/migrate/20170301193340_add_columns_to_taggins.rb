class AddColumnsToTaggins < ActiveRecord::Migration[5.0]
  def change
    add_column :taggings, :note_id, :integer
    add_column :taggings, :tag_id, :integer
  end
end
