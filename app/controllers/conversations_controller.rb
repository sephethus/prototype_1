class ConversationsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit]
  before_filter :correct_user,   only: [:edit]

  def new
  	@conversation = current_user.conversations.build
  end

  def show
    @conversation = Conversation.find(params[:id])
    @replies = @conversation.replies
    @reply = current_user.replies.build
    @comments = @reply.comments
    @comment = current_user.comments.build
    #If I change the above line to @conversations.replies.build 
    #it breaks the ability to show replies above the form.
    #current_user.replies.build makes absolutely no sense.
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