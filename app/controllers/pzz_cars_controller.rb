class PzzCarsController < ApplicationController
  before_action :set_pzz_car, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!
  # GET /pzz_cars
  # GET /pzz_cars.json
  def index
    @pzz_cars = PzzCar.all
  end

  # GET /pzz_cars/1
  # GET /pzz_cars/1.json
  def show
  end

  # GET /pzz_cars/new
  def new
    @pzz_car = PzzCar.new
  end

  # GET /pzz_cars/1/edit
  def edit
  end

  # POST /pzz_cars
  # POST /pzz_cars.json
  def create
    @pzz_car = PzzCar.new(pzz_car_params)

    respond_to do |format|
      if @pzz_car.save
        format.html { redirect_to @pzz_car, notice: 'Pzz car was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_car }
      else
        format.html { render :new }
        format.json { render json: @pzz_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_cars/1
  # PATCH/PUT /pzz_cars/1.json
  def update
    respond_to do |format|
      if @pzz_car.update(pzz_car_params)
        format.html { redirect_to @pzz_car, notice: 'Pzz car was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_car }
      else
        format.html { render :edit }
        format.json { render json: @pzz_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_cars/1
  # DELETE /pzz_cars/1.json
  def destroy
    @pzz_car.destroy
    respond_to do |format|
      format.html { redirect_to pzz_cars_url, notice: 'Pzz car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_car
      @pzz_car = PzzCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_car_params
      params.require(:pzz_car).permit(:pzz_user_id, :pzz_driver_identity_id, :user_realname, :car_type, :car_brand_name, :car_seats, :car_plate_no, :car_vin, :car_engine_no, :identity_vl_no, :identity_vl_image, :identity_vl_issued, :insurance_corporate, :insurance_no, :insurance_expired, :insurance_image, :identity_status, :identity_remark)
    end
end
