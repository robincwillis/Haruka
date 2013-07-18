class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :show, :update]
  before_filter :admin_user,     only: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
	 @user = User.find(params[:id])
   @terms = @user.terms
   @favorites = @user.favorite_terms
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.accessible = []
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
  	@user = User.new
    @user.accessible = []#:all if false#current_user.nil?
    @user.attributes = params[:user]
  	if @user.save
  	  flash[:success] = "Hello #{@user.name}, Welcome to Haruka!"
      sign_in @user
      redirect_to terms_path
  	else
  		render 'new'
  	end
  end

  def destroy

    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def make_admin
    @user = User.find(params[:id])
    @user.accessible = [:admin] if current_user.admin?
    @user.admin = true

    if @user.update_attribute('admin', true)
      flash[:success] = "#{@user.name} Made Admin."
    redirect_to users_path  
    else
      flash[:error] = "Snaps... didn't work."
    redirect_to users_path  
    end
      
  end

  def destroy_admin
    @user = User.find(params[:id])
    @user.accessible = [:admin] if current_user.admin?
    @user.admin = false
    if @user.update_attribute('admin', false)
      flash[:success] = "#{@user.name} Revoked Admin Admin."
    redirect_to users_path  
    else
      flash[:error] = "Snaps... didn't work."
    redirect_to users_path  
    end  
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
