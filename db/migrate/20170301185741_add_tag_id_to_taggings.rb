class AddTagIdToTaggings < ActiveRecord::Migration[5.0]
  def change
    add_reference :taggings, :tag, foreign_key: true
  end
end
