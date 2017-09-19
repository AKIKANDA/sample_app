class AddImageIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :image_id, :string
  end
end
