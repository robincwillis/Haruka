class UsersController < ApplicationController

  def show
	 @user = User.find(params[:id])		
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  	 flash[:success] = "Welcome to Haruka!"
      redirect_to terms_path
  	else
  		render 'new'
  	end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
