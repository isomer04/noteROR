class AddDescriptionToWikiPost < ActiveRecord::Migration[7.1]
  def change
    add_column :wiki_posts, :description, :string
  end
end
