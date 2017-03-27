class AddColumnTagIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :tag_id, :integer
  end
end
