class PostsController < ApplicationController

  expose(:post)
  expose(:posts) { Post.order(:created_at).range(params[:period]).page(params[:page]) }

  def create
    post = Post.new(post_params)
    post.save
  end

  def update
    post.update(post_params)
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :description, :pain_level, :time, :comments, :meds, :non_drugs, {:description_ids => []})
    end

end
