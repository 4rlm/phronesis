class AddressingsController < ApplicationController
  before_action :set_addressing, only: [:show, :edit, :update, :destroy]

  # GET /addressings
  # GET /addressings.json
  def index
    @addressings = Addressing.all
  end

  # GET /addressings/1
  # GET /addressings/1.json
  def show
  end

  # GET /addressings/new
  def new
    @addressing = Addressing.new
  end

  # GET /addressings/1/edit
  def edit
  end

  # POST /addressings
  # POST /addressings.json
  def create
    @addressing = Addressing.new(addressing_params)

    respond_to do |format|
      if @addressing.save
        format.html { redirect_to @addressing, notice: 'Addressing was successfully created.' }
        format.json { render :show, status: :created, location: @addressing }
      else
        format.html { render :new }
        format.json { render json: @addressing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addressings/1
  # PATCH/PUT /addressings/1.json
  def update
    respond_to do |format|
      if @addressing.update(addressing_params)
        format.html { redirect_to @addressing, notice: 'Addressing was successfully updated.' }
        format.json { render :show, status: :ok, location: @addressing }
      else
        format.html { render :edit }
        format.json { render json: @addressing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addressings/1
  # DELETE /addressings/1.json
  def destroy
    @addressing.destroy
    respond_to do |format|
      format.html { redirect_to addressings_url, notice: 'Addressing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addressing
      @addressing = Addressing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addressing_params
      params.fetch(:addressing, {})
    end
end
