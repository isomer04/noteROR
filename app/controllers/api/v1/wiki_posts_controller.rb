class Api::V1::WikiPostsController < ApplicationController
    require 'csv'
    skip_before_action :verify_authenticity_token

    def index
        @wiki_posts = WikiPost.all
        render json: @wiki_posts
    end

    def show 
        #render a specific wikipost, found by ID as json 
        @wiki_post = WikiPost.find(params[:id])
        serialized = WikiPostSerializer.serialize(@wiki_post)
        render json: serialized
    end 

    def create
        #create a wikipost from params in the request body. Render error if failure.
        @wiki_post = WikiPost.new(wiki_posts_params)

        if @wiki_post.save
            render json: @wiki_post, status: :created
        else
            render json: @wiki_post.errors, status: :unprocessable_entity
        end
    end

    def update
        #finds the wikipost to update with parameters from request body. Render error if failure.
        @wiki_post = WikiPost.find(params[:id])

        if @wiki_post.update(wiki_posts_params)
            render json: @wiki_post
        else 
            render json: @wiki_post.errors, status: :unprocessable_entity
        end
    end

    def destroy
        #destroy a wiki post with the provided id
        @wiki_post = WikiPost.find(params[:id])
        @wiki_post.destroy
        head :no_content
    end

    def xml_index
        @wiki_posts = WikiPost.all
        render xml: @wiki_posts
    end

    def csv_index
        @wiki_posts = WikiPost.all
        csv_data = CSV.generate do |csv|
            csv << ["ID", "Title", "Description", "Author"]
            @wiki_posts.each do |post|
                csv << [post.id, post.title, post.description, post.author]
            end
        end
        send_data csv_data, filename: "wiki_posts.csv", type: "text/csv"
    end

    private 

    def wiki_posts_params
        params.permit(:title, :description, :author)
    end
end
