class TowsController < ApplicationController
  before_action :set_tow, only: [:show, :edit, :update, :destroy]

  # GET /tows
  # GET /tows.json
  def index
    @tows = Tow.all
  end

  # GET /tows/1
  # GET /tows/1.json
  def show
    ForecastIO.configure do |c|
      c.api_key = "1a863a051346e9679b5be7d8a6fb01c7"
    end
    @meteo = ForecastIO.forecast(@tow.lat, @tow.lon).currently.summary
  end

  # GET /tows/new
  def new
    @tow = Tow.new
  end

  # GET /tows/1/edit
  def edit
  end

  # POST /tows
  # POST /tows.json
  def create
    @tow = Tow.new(tow_params)

    respond_to do |format|
      if @tow.save
        format.html { redirect_to @tow, notice: 'Tow was successfully created.' }
        format.json { render :show, status: :created, location: @tow }
      else
        format.html { render :new }
        format.json { render json: @tow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tows/1
  # PATCH/PUT /tows/1.json
  def update
    respond_to do |format|
      if @tow.update(tow_params)
        format.html { redirect_to @tow, notice: 'Tow was successfully updated.' }
        format.json { render :show, status: :ok, location: @tow }
      else
        format.html { render :edit }
        format.json { render json: @tow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tows/1
  # DELETE /tows/1.json
  def destroy
    @tow.destroy
    respond_to do |format|
      format.html { redirect_to tows_url, notice: 'Tow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tow
      @tow = Tow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tow_params
      params.require(:tow).permit(:name, :lon, :lat)
    end
end
