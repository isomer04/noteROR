require 'rails_helper'

RSpec.describe WikiPost, type: :model do
    context 'scopes' do
        let!(:wiki_post1) {  WikiPost.create!(title: 'My first post', description: 'Description for the first post', author: 'Author A', created_at: Time.now) }
        let!(:wiki_post2) {WikiPost.create!(title: 'My second post', description: 'Description for the second post', author: 'Author B', created_at: 1.day.ago) }

    it '#contributors' do 
        contributors = ["Author A", "Author B"]
        expect(WikiPost.contributors).to eq(contributors)
    end 

    it '#sort_by_created_at' do 
    sort_by_created = [wiki_post1, wiki_post2]
    expect(WikiPost.sort_by_created).to eq(sort_by_created)
    end 

    end 
end 