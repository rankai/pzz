require 'date'
class PzzLinesController < ApplicationController
  before_action :set_pzz_line, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user_from_token!, except: [:index, :search]
  before_filter :authenticate_pzz_user!, except: [:index, :search]

  wrap_parameters PzzLine

  # GET /pzz_lines
  # GET /pzz_lines.json
  api :GET, '/pzz_lines', "返回所有的线路"
  api :GET, '/pzz_lines.json', "返回所有的线路（JSON格式）"
  def index
    @pzz_lines = PzzLine.all
  end

  # GET /pzz_users/:pzz_user_id/pzz_lines
  # GET /pzz_users/:pzz_user_id/pzz_lines.json
  api :GET, '/pzz_users/:pzz_user_id/pzz_lines', "返回指定用户的所有线路"
  api :GET, '/pzz_users/:pzz_user_id/pzz_lines.json', "返回指定用户的所有线路（JSON格式）"
  def user_lines
    @pzz_lines = PzzLine.find_by(pzz_user_id: params[:pzz_user_id])
    respond_to do |format|
      format.json { render json: @pzz_lines }
    end
  end


  # GET /pzz_lines/1
  # GET /pzz_lines/1.json
  api :GET, '/pzz_lines/:id', "根据ID获取指定的线路"
  api :GET, '/pzz_lines/:id.json', "根据ID获取指定的线路（JSON格式）"
  param :id, :number
  def show
  end

  # GET /pzz_lines/new
  def new
    @pzz_line = PzzLine.new
  end

  # GET /pzz_lines/1/edit
  def edit
  end

  # POST /pzz_lines
  # POST /pzz_lines.json
  def create

    begin
      format = '%Y-%m-%d %H:%M:%S'
      depart_at_formatted = DateTime.parse(pzz_line_params[:line_depart_datetime].to_s).strftime(format)
      return_at_formatted = DateTime.parse(pzz_line_params[:line_return_datetime].to_s).strftime(format)

      pzz_line_params[:line_depart_datetime] = depart_at_formatted
      pzz_line_params[:line_return_datetime] = return_at_formatted
      p "#{pzz_line_params[:line_depart_datetime]}"
  rescue => e
      logger.error "pzz_line_controller::create => exception #{e.class.name} : #{e.message}"
      # redirect somewhere sensible?
      head :unprocessable_entity
      return
    end

    @pzz_line = PzzLine.new(pzz_line_params)

    respond_to do |format|
      if @pzz_line.save
        format.html { redirect_to @pzz_line, notice: 'Pzz line was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_line }
      else
        format.html { render :new }
        format.json { render json: @pzz_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pzz_lines/1
  # PATCH/PUT /pzz_lines/1.json
  def update
    respond_to do |format|
      if @pzz_line.update(pzz_line_params)
        format.html { redirect_to @pzz_line, notice: 'Pzz line was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_line }
      else
        format.html { render :edit }
        format.json { render json: @pzz_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pzz_lines/1
  # DELETE /pzz_lines/1.json
  def destroy
    @pzz_line.destroy
    respond_to do |format|
      format.html { redirect_to pzz_lines_url, notice: 'Pzz line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  api :POST, '/pzz_lines/search', '返回所有满足筛选条件的线路'
  api :POST, '/pzz_lines/search.json', '返回所有满足筛选条件的线路（JSON格式）'
  def search
    @pzz_lines = PzzLine.where(params[:pzz_line])
    respond_to do |format|
      format.json { render json: @pzz_lines}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_line
      @pzz_line = PzzLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_line_params
      params.require(:pzz_line).permit(:pzz_user_id, :user_nickname, :user_realname, :user_phone, :user_email, :user_type, :line_type, :line_depart_datetime, :line_return, :line_return_datetime, :line_participants, :line_participants_available, :line_status, :line_price, :line_depart_city, :line_depart_address, :line_depart_gps, :line_dest_city, :line_dest_address, :line_dest_gps, :line_midway, :line_milleage, :line_elapse, :line_fuel, :line_expire_datetime, :line_plan_type, :line_week_day, :line_remark)
    end
end
