class CommentsController < ApplicationController

	before_filter :signed_in_user, only: [:create]
	before_filter :admin_user,     only: [:destroy]

	def create

		@term = Term.find(params[:term_id])
		@comment = @term.comments.create(params[:comment].merge(
	            :user_id => current_user.id
	        ) )
		
		if @comment.save
			flash[:error] = "Comment added to #{@term.name}"
			redirect_to @term
		else
			flash[:error] = "Couldn't create that comment. It must be at least 5 characters"
			redirect_to :back
		end

	end

	def destroy
		@term = Term.find(params[:term_id])
	    @comment = @term.comments.find(params[:id])
	    @comment.destroy
	    redirect_to @term
	end

private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def admin_user
      redirect_to(terms_path) unless current_user.admin?
    end

end
