class RemoveNoteIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, name: "index_users_on_note_id"
    remove_foreign_key "users", "notes"
    remove_column :users, :note_id
  end
end
