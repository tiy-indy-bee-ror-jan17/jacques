class RenameColumnPasswordDigest < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password_digest, :password
  end
end
