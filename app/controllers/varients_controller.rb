class VarientsController < ApplicationController
  
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
        format.html { redirect_to(@term, notice: "Varient Created") }
        format.js
        format.json { render json: @term_varient, status: :created }
      else
        #flash[:error] = "shit"
        format.html { redirect_to root_url }
        format.js
        format.json { render json: @varient.errors, status: :unprocessable_entity }
      end
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
