class TypeaheadsController < ApplicationController

	def varient
		@search = params[:search]
		@varients = Term.search(@search)

		respond_to do |format|
			format.json { render :json => @varients.as_json(:only => [:term, :term_id])}
		end
	end

end
