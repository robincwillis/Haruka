class PhrasesController < ApplicationController

def create
	@term = Term.find(params[:term_id])
	@phrase = @term.phrases.create(params[:phrase].merge(
            :user_id => current_user.id
        ) )

	if @phrase.save
		redirect_to term_path(@term)
	else
		redirect_to :back, notice: "Couldn't create that phrase."
	end

end


end