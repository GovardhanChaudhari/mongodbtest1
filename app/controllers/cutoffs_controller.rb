class CutoffsController < ApplicationController
  # GET /cutoffs
  # GET /cutoffs.json
  def index
    @cutoffs = Cutoff.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cutoffs }
    end
  end

  # GET /cutoffs/1
  # GET /cutoffs/1.json
  def show
    @cutoff = Cutoff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cutoff }
    end
  end

  # GET /cutoffs/new
  # GET /cutoffs/new.json
  def new
    @cutoff = Cutoff.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cutoff }
    end
  end

  # GET /cutoffs/1/edit
  def edit
    @cutoff = Cutoff.find(params[:id])
  end

  # POST /cutoffs
  # POST /cutoffs.json
  def create
    @cutoff = Cutoff.new(params[:cutoff])

    respond_to do |format|
      if @cutoff.save
        format.html { redirect_to @cutoff, notice: 'Cutoff was successfully created.' }
        format.json { render json: @cutoff, status: :created, location: @cutoff }
      else
        format.html { render action: "new" }
        format.json { render json: @cutoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cutoffs/1
  # PUT /cutoffs/1.json
  def update
    @cutoff = Cutoff.find(params[:id])

    respond_to do |format|
      if @cutoff.update_attributes(params[:cutoff])
        format.html { redirect_to @cutoff, notice: 'Cutoff was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cutoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cutoffs/1
  # DELETE /cutoffs/1.json
  def destroy
    @cutoff = Cutoff.find(params[:id])
    @cutoff.destroy

    respond_to do |format|
      format.html { redirect_to cutoffs_url }
      format.json { head :no_content }
    end
  end
end
