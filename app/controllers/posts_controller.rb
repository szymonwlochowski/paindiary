class PostsController < ApplicationController

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.order(time: :desc).range(params[:period]).page(params[:page]) }
  expose(:post_descs) { Description.own(current_user.id) }
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

  def remove_element
    post.destroy
    redirect_to posts_path
  end

  def index
    respond_to do |format|
      format.html
      format.csv { render csv: Post.all }
    end
  end

  def charts
  end

  private

    def new_post_params
      params.permit(:title, :body, :description, :pain_level, :time, :comments, :meds, :bodypart_id, {:description_ids => []}) if params.present?
    end

    def post_params
      params.require(:post).permit(:title, :body, :description, :pain_level, :time, :comments, :meds, :bodypart_id, :non_drugs, {:description_ids => []}) if params[:post].present?
    end

end

