class PzzLinesController < ApplicationController
  before_action :set_pzz_line, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!, except: [:index]

  wrap_parameters PzzLine

  # GET /pzz_lines
  # GET /pzz_lines.json
  api :GET, '/pzz_lines', "Get all pz lines"
  api :GET, '/pzz_lines.json', "Get all pz lines in json"
  def index
    @pzz_lines = PzzLine.all
  end

  # GET /pzz_lines/1
  # GET /pzz_lines/1.json
  api :GET, '/pzz_lines/:id', "Get a pz line by id"
  api :GET, '/pzz_lines/:id.json', "Get a pz line in json by id"
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
