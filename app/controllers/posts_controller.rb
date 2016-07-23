class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def show
  end

  def create
    @discussion_thread = DiscussionThread.find(params[:discussion_thread_id])
    @post = @discussion_thread.replies.create(post_params)
    @post.author = current_user

    respond_to do |format|
      if @post.save

        if params[:attachments]
          params[:attachments].each do |attachment|
            attached_image = @post.attachments.create(image: attachment)
            attached_image.save
            attached_image.errors
          end
        end

        format.html { redirect_to discussion_thread_url(@discussion_thread), notice: 'Post was successfully added.' }
        format.json { render :show, status: :created, location: @discussion_thread }
      else
        format.html { redirect_to discussion_thread_url(@discussion_thread), alert: 'Failed to add post.' }
        format.json { render json: @discussion_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.json { render :show, status: :ok, location: discussion_thread_post_url }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :images)
  end
end
