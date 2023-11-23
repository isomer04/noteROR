class WikiPostsController < ApplicationController
  before_action :set_wiki_post, only: %i[show edit update destroy soft_delete restore]

  # GET /wiki_posts or /wiki_posts.json
  def index
    @wiki_posts = WikiPost.all
  end

  # GET /wiki_posts/1 or /wiki_posts/1.json
  def show
  end

  def example
  end

  # GET /wiki_posts/new
  def new
    @wiki_post = WikiPost.new
  end

  # GET /wiki_posts/1/edit
  def edit
  end

  # POST /wiki_posts or /wiki_posts.json
  def create
    @wiki_post = WikiPost.new(wiki_post_params)

    respond_to do |format|
      if @wiki_post.save
        format.html { redirect_to wiki_post_url(@wiki_post), notice: "Wiki post was successfully created." }
        format.json { render :show, status: :created, location: @wiki_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wiki_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wiki_posts/1 or /wiki_posts/1.json
  def update
    respond_to do |format|
      if @wiki_post.update(wiki_post_params)
        format.html { redirect_to wiki_post_url(@wiki_post), notice: "Wiki post was successfully updated." }
        format.json { render :show, status: :ok, location: @wiki_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wiki_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiki_posts/1 or /wiki_posts/1.json
  def destroy
    @wiki_post.destroy!

    respond_to do |format|
      format.html { redirect_to wiki_posts_url, notice: "Wiki post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

   # Soft delete action
   def soft_delete
    @wiki_post.soft_delete
    redirect_to wiki_posts_url, notice: 'Wiki post was moved to the trash.'
  end

  def deleted
    puts 'Debug: Deleted action is called!'
    @deleted_wiki_posts = WikiPost.only_deleted.where.not(deleted_at: nil)
    puts "Debug: Found #{@deleted_wiki_posts&.count || 0} deleted posts."
  end
  

  def restore
    wiki_post = WikiPost.only_deleted.find_by(id: params[:id])
    
    if wiki_post
      wiki_post.restore
      redirect_to wiki_posts_path, notice: 'Wiki post was successfully restored.'
    else
      redirect_to deleted_wiki_posts_path, alert: 'Invalid operation on deleted posts.'
    end
  end

  def contributor_posts
    @contributor = params[:contributor].downcase
    @contributor_posts = WikiPost.where("LOWER(author) = ?", @contributor)
  
    respond_to do |format|
      format.html # This will render contributor_posts.html.erb
      format.json { render json: @contributor_posts } # Adjust as needed
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki_post
      if params[:id] == 'deleted'
        redirect_to deleted_wiki_posts_path, alert: 'Invalid operation on deleted posts.'
      else
        @wiki_post = WikiPost.unscoped.find(params[:id])
      end
    end
    

    # Only allow a list of trusted parameters through.
    def wiki_post_params
      params.fetch(:wiki_post,  {}).permit(:title, :description, :author, :image)
    end

   
end
