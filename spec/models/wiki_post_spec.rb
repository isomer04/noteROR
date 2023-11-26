require 'rails_helper'

RSpec.describe WikiPost, type: :model do
    context 'scopes' do
        let!(:wiki_post1) { FactoryBot.create(:wiki_post, author: 'Author A') }
        let!(:wiki_post2) { FactoryBot.create(:wiki_post, :old, author: 'Author B') }

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