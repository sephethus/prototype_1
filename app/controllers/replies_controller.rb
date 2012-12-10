class RepliesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit]
  before_filter :correct_user,   only: [:edit]

  def new
  	@reply = conversation.replies.build
  end

  def create
  	@reply = conversation.replies.build(content: params[:reply][:content], user_id: current_user.id)
  	if @reply.save
  	  	flash[:success] = "Post created!"
  	  	redirect_to conversation_path(@conversation)
  	else
        flash[:error] = @reply.errors.full_messages
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

  def correct_user
      @reply = current_user.replies.find_by_id(params[:id])
      redirect_to root_url if @reply.nil?
  end

  def conversation
    @conversation ||= Conversation.find(params[:conversation_id])
  end
end
