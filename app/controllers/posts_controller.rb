class PostsController < ApplicationController

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.order(:created_at).range(params[:period]).page(params[:page]) }
  expose(:nowaku) { Post.all.order(created_at: :desc) }

  def new
    post.assign_attributes(new_post_params || {})
  end

  def create
    if post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if post.save
      redirect_to post_path(post)
    else
      render :edit
    end
  end

  private

    def new_post_params
      params.permit(:title) if params.present?
    end

    def post_params
      params.require(:post).permit(:title, :body, :description, :pain_level, :time, :comments, :meds, :bodypart_id, :non_drugs, {:description_ids => []}) if params[:post].present?
    end

end
