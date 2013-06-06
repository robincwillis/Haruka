class VarientsController < ApplicationController
  
  # POST /varients
  # POST /varients.json
  def create
    @term = Term.find(params[:term_id])
    @varient = @term.varients.build( :term_varient_id => params[:term_varient_id])
    #Varient.new(params[:varient])

    if @varient.save
      flash[:notice] = "Successfully created varient."
      redirect_to root_url
    else
      flash[:error] = "shit"
      redirect_to root_url
    end
  end

  # DELETE /varients/1
  # DELETE /varients/1.json
  def destroy
    @varient = Varient.find(params[:id])
    @varient.destroy

    flash[:notice] = "Successfully destroyed varient."
    redirect_to root_url
  end
end
