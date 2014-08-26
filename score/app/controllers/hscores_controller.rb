class HscoresController < ApplicationController
  before_action :set_hscore, only: [:show, :edit, :update, :destroy]

  # GET /hscores
  # GET /hscores.json
  def index
    @hscores = Hscore.all
  end

  # GET /hscores/1
  # GET /hscores/1.json
  def show
  end

  # GET /hscores/new
  def new
    @hscore = Hscore.new
  end

  # GET /hscores/1/edit
  def edit
  end

  # POST /hscores
  # POST /hscores.json
  def create
    @hscore = Hscore.new(hscore_params)

    respond_to do |format|
      if @hscore.save
        format.html { redirect_to @hscore, notice: 'Hscore was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hscore }
      else
        format.html { render action: 'new' }
        format.json { render json: @hscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hscores/1
  # PATCH/PUT /hscores/1.json
  def update
    respond_to do |format|
      if @hscore.update(hscore_params)
        format.html { redirect_to @hscore, notice: 'Hscore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hscores/1
  # DELETE /hscores/1.json
  def destroy
    @hscore.destroy
    respond_to do |format|
      format.html { redirect_to hscores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hscore
      @hscore = Hscore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hscore_params
      params.require(:hscore).permit(:game, :score)
    end
end
