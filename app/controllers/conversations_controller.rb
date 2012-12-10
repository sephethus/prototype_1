class ConversationsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit]
  before_filter :correct_user,   only: [:edit]

  def new
  	@conversation = current_user.conversations.build
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reply_items = @conversation.replies
    @reply = @conversation.replies.build
  end

  def create
  	@conversation = current_user.conversations.build(params[:conversation])
  	if @conversation.save
  		flash[:success] = "Post created!"
  		redirect_to conversation_path(@conversation)
  	else
  		render 'new'
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
      @conversation = current_user.conversations.find_by_id(params[:id])
      redirect_to root_url if @conversation.nil?
  end

end