class RenameAuthToApi < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :auth_token, :api_token
  end
end
