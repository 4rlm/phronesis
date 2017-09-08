class UrlingsController < ApplicationController
  before_action :set_urling, only: [:show, :edit, :update, :destroy]

  # GET /urlings
  # GET /urlings.json
  def index
    @urlings = Urling.all
  end

  # GET /urlings/1
  # GET /urlings/1.json
  def show
  end

  # GET /urlings/new
  def new
    @urling = Urling.new
  end

  # GET /urlings/1/edit
  def edit
  end

  # POST /urlings
  # POST /urlings.json
  def create
    @urling = Urling.new(urling_params)

    respond_to do |format|
      if @urling.save
        format.html { redirect_to @urling, notice: 'Urling was successfully created.' }
        format.json { render :show, status: :created, location: @urling }
      else
        format.html { render :new }
        format.json { render json: @urling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urlings/1
  # PATCH/PUT /urlings/1.json
  def update
    respond_to do |format|
      if @urling.update(urling_params)
        format.html { redirect_to @urling, notice: 'Urling was successfully updated.' }
        format.json { render :show, status: :ok, location: @urling }
      else
        format.html { render :edit }
        format.json { render json: @urling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urlings/1
  # DELETE /urlings/1.json
  def destroy
    @urling.destroy
    respond_to do |format|
      format.html { redirect_to urlings_url, notice: 'Urling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urling
      @urling = Urling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urling_params
      params.fetch(:urling, {})
    end
end
