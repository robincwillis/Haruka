class CommentsController < ApplicationController

def create

	@term = Term.find(params[:term_id])
	@comment = @term.comments.create(params[:comment].merge(
            :user_id => current_user.id
        ) )
	
	if @comment.save
		redirect_to term_path(@term)
	else
		redirect_to :back, notice: "Couldn't create that comment."
	end
end

end
