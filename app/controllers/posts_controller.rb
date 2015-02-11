class PostsController < ApplicationController

  expose(:post)
  expose(:posts) { Post.order(:created_at).range(params[:period]).page(params[:page]) }
  expose(:nowaku) { Post.all.order(created_at: :desc) }

  def create
    post = Post.new(post_params)
    post.save
    redirect_to posts_path
  end

  def update
    post.update(post_params)
    redirect_to post_path(post)
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :description, :pain_level, :time, :comments, :meds, :non_drugs, {:description_ids => []})
    end

end
