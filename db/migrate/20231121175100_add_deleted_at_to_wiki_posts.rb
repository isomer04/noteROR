class AddDeletedAtToWikiPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :wiki_posts, :deleted_at, :datetime
  end
end
