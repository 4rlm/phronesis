class CrmingsController < ApplicationController
  before_action :set_crming, only: [:show, :edit, :update, :destroy]

  # GET /crmings
  # GET /crmings.json
  def index
    @crmings = Crming.all
  end

  # GET /crmings/1
  # GET /crmings/1.json
  def show
  end

  # GET /crmings/new
  def new
    @crming = Crming.new
  end

  # GET /crmings/1/edit
  def edit
  end

  # POST /crmings
  # POST /crmings.json
  def create
    @crming = Crming.new(crming_params)

    respond_to do |format|
      if @crming.save
        format.html { redirect_to @crming, notice: 'Crming was successfully created.' }
        format.json { render :show, status: :created, location: @crming }
      else
        format.html { render :new }
        format.json { render json: @crming.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crmings/1
  # PATCH/PUT /crmings/1.json
  def update
    respond_to do |format|
      if @crming.update(crming_params)
        format.html { redirect_to @crming, notice: 'Crming was successfully updated.' }
        format.json { render :show, status: :ok, location: @crming }
      else
        format.html { render :edit }
        format.json { render json: @crming.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crmings/1
  # DELETE /crmings/1.json
  def destroy
    @crming.destroy
    respond_to do |format|
      format.html { redirect_to crmings_url, notice: 'Crming was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crming
      @crming = Crming.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crming_params
      params.fetch(:crming, {})
    end
end
