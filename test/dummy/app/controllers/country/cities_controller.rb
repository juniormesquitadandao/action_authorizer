class Country::CitiesController < ApplicationController
  before_action :set_country_city, only: [:show, :edit, :update, :destroy]

  # GET /country/cities
  # GET /country/cities.json
  def index
    @country_cities = Country::City.all
  end

  # GET /country/cities/1
  # GET /country/cities/1.json
  def show
  end

  # GET /country/cities/new
  def new
    @country_city = Country::City.new
  end

  # GET /country/cities/1/edit
  def edit
  end

  # POST /country/cities
  # POST /country/cities.json
  def create
    @country_city = Country::City.new(country_city_params)

    respond_to do |format|
      if @country_city.save
        format.html { redirect_to @country_city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @country_city }
      else
        format.html { render :new }
        format.json { render json: @country_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country/cities/1
  # PATCH/PUT /country/cities/1.json
  def update
    respond_to do |format|
      if @country_city.update(country_city_params)
        format.html { redirect_to @country_city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @country_city }
      else
        format.html { render :edit }
        format.json { render json: @country_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country/cities/1
  # DELETE /country/cities/1.json
  def destroy
    @country_city.destroy
    respond_to do |format|
      format.html { redirect_to country_cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_city
      @country_city = Country::City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_city_params
      params.require(:country_city).permit(:name)
    end
end
