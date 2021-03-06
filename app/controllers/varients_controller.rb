class VarientsController < ApplicationController
  
  before_filter :can_create,   only: [:create]
  before_filter :can_destroy,   only: [:destroy]

  # POST /varients
  # POST /varients.json
  def create
    #debugger
    @term = Term.find(params[:term_id])
    @varient = @term.varients.build( :term_varient_id => params[:term_varient_id])
    @term_varient = Term.find(params[:term_varient_id]);
    #Varient.new(params[:varient])
    respond_to do |format|

      if @varient.save
        #flash[:notice] = "Successfully created varient."
        format.html { redirect_to(@term, notice: "Varient #{@varient.name} Created") }
        format.js
        format.json { render json: { term_varient: @term_varient, varient: @varient}, status: :created }
      else
        #flash[:error] = "shit"
        format.html { redirect_to @term }
        format.js
        format.json { render json: @varient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /varients/1
  # DELETE /varients/1.json
  def destroy

    Varient.find(params[:id]).destroy
 
    flash[:notice] = "Successfully destroyed varient."
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js { render nothing: true }
    end
  end

private
    
    def can_create
      @term = Term.find(params[:term_id])
      @user = User.find(@term.user_id)

      redirect_to(terms_path) unless current_user?(@user) or current_user.admin?

    end

    def can_destroy
      @term = Term.find(Varient.find(params[:id]).term_id)
      @user = User.find(@term.user_id)

      redirect_to(terms_path) unless current_user?(@user) or current_user.admin?

    end
end
