class PzzTrafficsController < ApplicationController
  before_action :set_pzz_traffic, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!, except: ['index']

  wrap_parameters PzzTraffic

  # GET /pzz_traffics
  # GET /pzz_traffics.json
  def index
    @pzz_traffics = PzzTraffic.all
  end

  # GET /pzz_traffics/1
  # GET /pzz_traffics/1.json
  def show
  end

  # GET /pzz_traffics/new
  def new
    @pzz_traffic = PzzTraffic.new
  end

  # GET /pzz_traffics/1/edit
  def edit
  end

  # POST /pzz_traffics
  # POST /pzz_traffics.json
  def create
    @pzz_traffic = PzzTraffic.new(pzz_traffic_params)

    respond_to do |format|
      if @pzz_traffic.save
        format.html { redirect_to @pzz_traffic, notice: 'Pzz traffic was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_traffic }
      else
        format.html { render :new }
        format.json { render json: @pzz_traffic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_traffics/1
  # PATCH/PUT /pzz_traffics/1.json
  def update
    respond_to do |format|
      if @pzz_traffic.update(pzz_traffic_params)
        format.html { redirect_to @pzz_traffic, notice: 'Pzz traffic was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_traffic }
      else
        format.html { render :edit }
        format.json { render json: @pzz_traffic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_traffics/1
  # DELETE /pzz_traffics/1.json
  def destroy
    @pzz_traffic.destroy
    respond_to do |format|
      format.html { redirect_to pzz_traffics_url, notice: 'Pzz traffic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_traffic
      @pzz_traffic = PzzTraffic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_traffic_params
      params.require(:pzz_traffic).permit(:pzz_user_id, :traffic_keywords, :traffic_image, :traffic_description, :traffic_gps)
    end
end
