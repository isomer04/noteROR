require 'rails_helper'

RSpec.describe WikiPost, type: :model do
    it '#contributors' do

        WikiPost.create!(title: 'My first post', description: 'Description for the first post', author: 'Author A')
        WikiPost.create!(title: 'My second post', description: 'Description for the second post', author: 'Author B')
        WikiPost.create!(title: 'My third post', description: 'Description for the third post', author: 'Author C')
        WikiPost.create!(title: 'My fourth post', description: 'Description for the fourth post', author: 'Author D')

        contributors = ["Author A", "Author B", "Author C", "Author D"] 

        expect(WikiPost.contributors).to eq(contributors)

    end
end