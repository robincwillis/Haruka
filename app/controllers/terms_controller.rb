class TermsController < ApplicationController
  
  include SessionsHelper
  # GET /terms
  # GET /terms.json
  def index
    @terms = Term.all
    #temp for now, should replace with http://pat.github.io/thinking-sphinx/
    @terms = Term.search(params[:search]).group_by{|u| u.name[0]}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terms }
    end
end
  # GET /terms/1
  # GET /terms/1.json
  def show
    @term = Term.find(params[:id])
    @terms = Term.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @term }
    end
  end

  # GET /terms/new
  # GET /terms/new.json
  def new
    @term = Term.new
    @terms = Term.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @term }
    end
  end

  # GET /terms/1/edit
  def edit
    @term = Term.find(params[:id])
    @terms = Term.all
  end

  # POST /terms
  # POST /terms.json
  def create
    @terms = Term.all
    @term = Term.new(params[:term])

    respond_to do |format|
      if @term.save
        format.html { redirect_to @term, notice: 'Term was successfully created.' }
        format.json { render json: @term, status: :created, location: @term }
      else
        format.html { render action: "new" }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terms/1
  # PUT /terms/1.json
  def update
    @terms = Term.all
    @term = Term.find(params[:id])

    respond_to do |format|
      if @term.update_attributes(params[:term])
        format.html { redirect_to @term, notice: 'Term was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    respond_to do |format|
      format.html { redirect_to terms_url }
      format.json { head :no_content }
    end
  end
end
