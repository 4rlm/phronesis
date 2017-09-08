class PhoningsController < ApplicationController
  before_action :set_phoning, only: [:show, :edit, :update, :destroy]

  # GET /phonings
  # GET /phonings.json
  def index
    @phonings = Phoning.all
  end

  # GET /phonings/1
  # GET /phonings/1.json
  def show
  end

  # GET /phonings/new
  def new
    @phoning = Phoning.new
  end

  # GET /phonings/1/edit
  def edit
  end

  # POST /phonings
  # POST /phonings.json
  def create
    @phoning = Phoning.new(phoning_params)

    respond_to do |format|
      if @phoning.save
        format.html { redirect_to @phoning, notice: 'Phoning was successfully created.' }
        format.json { render :show, status: :created, location: @phoning }
      else
        format.html { render :new }
        format.json { render json: @phoning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phonings/1
  # PATCH/PUT /phonings/1.json
  def update
    respond_to do |format|
      if @phoning.update(phoning_params)
        format.html { redirect_to @phoning, notice: 'Phoning was successfully updated.' }
        format.json { render :show, status: :ok, location: @phoning }
      else
        format.html { render :edit }
        format.json { render json: @phoning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phonings/1
  # DELETE /phonings/1.json
  def destroy
    @phoning.destroy
    respond_to do |format|
      format.html { redirect_to phonings_url, notice: 'Phoning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phoning
      @phoning = Phoning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phoning_params
      params.fetch(:phoning, {})
    end
end
