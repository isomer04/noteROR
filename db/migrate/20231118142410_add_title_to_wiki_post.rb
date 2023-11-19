class AddTitleToWikiPost < ActiveRecord::Migration[7.1]
  def change
    add_column :wiki_posts, :title, :string
  end
end
