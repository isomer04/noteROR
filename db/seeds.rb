# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


WikiPost.create!(title: 'My first post', description: 'Description for the first post', author: 'Author A')
WikiPost.create!(title: 'My second post', description: 'Description for the second post', author: 'Author B')
WikiPost.create!(title: 'My third post', description: 'Description for the third post', author: 'Author C')
WikiPost.create!(title: 'My fourth post', description: 'Description for the fourth post', author: 'Author D')


