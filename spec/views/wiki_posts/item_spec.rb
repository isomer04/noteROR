require 'rails_helper'

RSpec.describe WikiPost, type: :feature do
  it 'soft deletes a wiki post' do
    wiki_post = FactoryBot.create(:wiki_post)
    wiki_post.destroy
    expect(wiki_post.deleted_at).to be_present
  end

  it 'restores a soft-deleted wiki post' do
    wiki_post = FactoryBot.create(:wiki_post)
    wiki_post.destroy
    wiki_post.restore
    expect(wiki_post.deleted_at).to be_nil
  end

  it 'excludes soft-deleted wiki posts from normal queries' do
    wiki_post1 = FactoryBot.create(:wiki_post)
    wiki_post2 = FactoryBot.create(:wiki_post)
    wiki_post2.destroy
    expect(WikiPost.all).to eq([wiki_post1])
  end
end
