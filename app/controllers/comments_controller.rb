class CommentsController < ApplicationController

def create

	@term = Term.find(params[:term_id])
	@comment = @term.comments.create(params[:comment])
	redirect_to term_path(@term)

end

end
