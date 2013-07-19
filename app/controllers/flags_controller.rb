class FlagsController < ApplicationController

   before_filter :signed_in_user, only: [:create]
   before_filter :admin_user,     only: [:index, :destroy]

	def index
		#@flaggable = find_flaggable
		@flags = Flag.all #@flaggable.all
		@terms = Term.all
	end

	def new
	end

	def create
		@flaggable = Term.find(params[:flag][:id]);#find_flaggable
		
		@flag = @flaggable.flags.build(params[:flag])
			
	    respond_to do |format|
			if @flag.save
			   	format.js
				format.html { redirect_to @flaggable, notice: 'Flagged that shit.' }
			else
				format.js
				format.html { redirect_to @flaggable, notice: 'Something went wrong.' }
			end
		end
	end

	def destroy
		@flag = Flag.find(params[:id])
		@flag.destroy
		flash[:notice] = "Destroyed flag."
		redirect_to flags_url
	end

private

	def find_flaggable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.find(value)
	    end
	  end
	  nil
	end

	def signed_in_user
	  redirect_to signin_url, notice: "Please sign in." unless signed_in?
	end

	def admin_user
	  redirect_to(terms_path) unless current_user.admin?
	end


end
