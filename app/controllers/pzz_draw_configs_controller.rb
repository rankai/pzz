class PzzDrawConfigsController < ApplicationController
  before_action :set_pzz_draw_config, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!

  # GET /pzz_draw_configs
  # GET /pzz_draw_configs.json
  def index
    @pzz_draw_configs = PzzDrawConfig.all
  end

  # GET /pzz_draw_configs/1
  # GET /pzz_draw_configs/1.json
  def show
  end

  # GET /pzz_draw_configs/new
  def new
    @pzz_draw_config = PzzDrawConfig.new
  end

  # GET /pzz_draw_configs/1/edit
  def edit
  end

  # POST /pzz_draw_configs
  # POST /pzz_draw_configs.json
  def create
    @pzz_draw_config = PzzDrawConfig.new(pzz_draw_config_params)

    respond_to do |format|
      if @pzz_draw_config.save
        format.html { redirect_to @pzz_draw_config, notice: 'Pzz draw config was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_draw_config }
      else
        format.html { render :new }
        format.json { render json: @pzz_draw_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_draw_configs/1
  # PATCH/PUT /pzz_draw_configs/1.json
  def update
    respond_to do |format|
      if @pzz_draw_config.update(pzz_draw_config_params)
        format.html { redirect_to @pzz_draw_config, notice: 'Pzz draw config was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_draw_config }
      else
        format.html { render :edit }
        format.json { render json: @pzz_draw_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_draw_configs/1
  # DELETE /pzz_draw_configs/1.json
  def destroy
    @pzz_draw_config.destroy
    respond_to do |format|
      format.html { redirect_to pzz_draw_configs_url, notice: 'Pzz draw config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_draw_config
      @pzz_draw_config = PzzDrawConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_draw_config_params
      params.require(:pzz_draw_config).permit(:draw_title, :draw_description, :draw_starttime, :draw_endtime, :user_filter, :draw_count, :draw_type, :draw_status)
    end
end
