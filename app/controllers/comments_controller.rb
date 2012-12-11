class CommentsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit]
  def new
  	@comment = reply.comments.build
  end

  def create
  	@comment = reply.comments.build(content: params[:comment][:content], user_id: current_user.id)
  	if @comment.save
  		flash[:success] = "Comment posted."
 		redirect_to conversation_path(@conversation)
  	else
  		redirect_to conversation_path(@conversation)
  	end
  end

private

	def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def conversation
	    @conversation ||= Conversation.find(params[:conversation_id])
  	end

  	def reply
  		@reply ||= @conversation.replies.find(params[:reply_id])
  	end
end
