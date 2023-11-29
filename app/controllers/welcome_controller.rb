class WelcomeController < ApplicationController
  def index
    @my_notes = current_user.wiki_posts if user_signed_in?
  end

  def about
    @wiki_posts = WikiPost.all
  end
end
