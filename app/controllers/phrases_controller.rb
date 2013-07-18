class PhrasesController < ApplicationController


	before_filter :signed_in_user, only: [:create]
	before_filter :admin_user,     only: [:destroy]

	def create
		@term = Term.find(params[:term_id])
		@phrase = @term.phrases.create(params[:phrase].merge(
	            :user_id => current_user.id
	        ) )

		if @phrase.save
			redirect_to term_path(@term)
			flash[:sucess] = "Phrase added to #{@term.name}"
		else
			flash[:error] = "Couldn't create that phrase. You must fill out both fields and use a minimum of 10 characters."
			redirect_to :back
		end

	end

	def destroy
		@term = Term.find(params[:term_id])
	    @phrase = @term.phrases.find(params[:id])
	    @phrase.destroy
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