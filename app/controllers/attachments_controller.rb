class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:destroy]

  def show
  end

  def destroy
    post = @attachment.attachable
    thread = post.thread

    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to discussion_thread_url(thread), notice: 'Attachment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    params.require(:@attachment)
  end

end
