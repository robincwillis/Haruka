class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
	 @user = User.find(params[:id])
   @terms = @user.terms
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  	  flash[:success] = "Welcome to Haruka!"
      sign_in @user
      redirect_to terms_path
  	else
  		render 'new'
  	end
  end

  def destroy

    @user = User.find(params[:id])

    terms = @user.terms.dup
    @user.destroy
    terms.should_not be_empty
    terms.each do |micropost|
      # Make sure the micropost doesn't appear in the database.
    end

    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(terms_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(terms_path) unless current_user.admin?
    end

end
