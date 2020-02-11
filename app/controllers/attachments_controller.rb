class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @file = ActiveStorage::Attachment.find(params[:id])
    if current_user.author_of?(@file.record)
      @file.purge
    else
      render status: 403
    end
  end
end
