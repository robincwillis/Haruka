class SessionsController < ApplicationController

def new
end

def create

  user = User.find_by_email(params[:session][:email].downcase)
  user.signing_in = true
  if user && user.authenticate(params[:session][:password])
    # Sign the user in and redirect to the user's show page.

    if params[:remember_me]
      sign_in_perm user
    else
      sign_in user      
    end


    redirect_back_or terms_url
  else
    flash[:error] = 'Invalid email/password combination.' # Not quite right!
    render 'new'
  end
end

def destroy
	sign_out
    flash[:sucess] = 'You have been signed out.' 
    redirect_to terms_url
end

end
