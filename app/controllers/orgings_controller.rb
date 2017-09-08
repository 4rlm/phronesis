class OrgingsController < ApplicationController
  before_action :set_orging, only: [:show, :edit, :update, :destroy]

  # GET /orgings
  # GET /orgings.json
  def index
    @orgings = Orging.all
  end

  # GET /orgings/1
  # GET /orgings/1.json
  def show
  end

  # GET /orgings/new
  def new
    @orging = Orging.new
  end

  # GET /orgings/1/edit
  def edit
  end

  # POST /orgings
  # POST /orgings.json
  def create
    @orging = Orging.new(orging_params)

    respond_to do |format|
      if @orging.save
        format.html { redirect_to @orging, notice: 'Orging was successfully created.' }
        format.json { render :show, status: :created, location: @orging }
      else
        format.html { render :new }
        format.json { render json: @orging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orgings/1
  # PATCH/PUT /orgings/1.json
  def update
    respond_to do |format|
      if @orging.update(orging_params)
        format.html { redirect_to @orging, notice: 'Orging was successfully updated.' }
        format.json { render :show, status: :ok, location: @orging }
      else
        format.html { render :edit }
        format.json { render json: @orging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgings/1
  # DELETE /orgings/1.json
  def destroy
    @orging.destroy
    respond_to do |format|
      format.html { redirect_to orgings_url, notice: 'Orging was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orging
      @orging = Orging.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orging_params
      params.fetch(:orging, {})
    end
end
