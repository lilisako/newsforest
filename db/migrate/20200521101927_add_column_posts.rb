class AddColumnPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :url, :string
    add_column :posts, :urlToImage, :string
    add_column :posts, :publishedAt, :string
  end
end
