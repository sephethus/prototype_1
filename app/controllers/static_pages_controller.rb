class StaticPagesController < ApplicationController

	def home
		if signed_in?
			@conversation_items = current_user.conversations
		end
	end
	
end
