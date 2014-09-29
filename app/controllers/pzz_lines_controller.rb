require 'date'
class PzzLinesController < ApplicationController
  before_action :set_pzz_line, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user_from_token!, except: [:index, :search, :show]
  before_filter :authenticate_pzz_user!, except: [:index, :search, :show]

  wrap_parameters PzzLine

  def_param_group :kaminari do
    param :page, String, :desc => "第几页", :required => false
    param :per_page, String, :desc => "每页路线条数", :required => false
  end

  def_param_group :pzz_line do 
    param :pzz_user_id,                   Integer,  :desc => "用户ID", :required => false
    param :user_nickname,                 String,   :desc => "昵称", :required => false 
    param :user_realname,                 String,   :desc => "真实姓名", :required => false 
    param :user_phone,                    String,   :desc => "联系电话", :required => false 
    param :user_email,                    String,   :desc => "邮箱", :required => false 
    param :user_type,                     Integer,  :desc => "用户类型", :required => false 
    param :line_type,                     Integer,  :desc => "线路类型", :required => false 
    param :line_depart_datetime,          String,   :desc => "出发时间", :required => false 
    param :line_return,                   Integer,  :desc => "是否返程", :required => false 
    param :line_return_datetime,          String,   :desc => "返程时间", :required => false 
    param :line_participants,             Integer,  :desc => "乘客申请（司机提供）的座位数", :required => false 
    param :line_participants_available,   Integer,  :desc => "司机剩余座位数", :required => false 
    param :line_status,                   Integer,  :desc => "线路状态", :required => false 
    param :line_price,                    Integer,  :desc => "价格", :required => false 
    param :line_depart_city,              String,   :desc => "出发城市", :required => false 
    param :line_depart_address,           String,   :desc => "出发地地址", :required => false 
    param :line_depart_gps,               String,   :desc => "出发地GPS", :required => false 
    param :line_dest_city,                String,   :desc => "目的城市", :required => false 
    param :line_dest_address,             String,   :desc => "目的地地址", :required => false 
    param :line_dest_gps,                 String,   :desc => "目的地GPS", :required => false 
    param :line_midway,                   String,   :desc => "线路途径地点", :required => false 
    param :line_milleage,                 Integer,  :desc => "线路里程", :required => false 
    param :line_elapse,                   Integer,  :desc => "线路时间", :required => false 
    param :line_fuel,                     Integer,  :desc => "邮费", :required => false 
    param :line_expire_datetime,          String,   :desc => "过期时间", :required => false 
    param :line_plan_type,                Integer,  :desc => "线路计划类型", :required => false 
    param :line_week_day,                 String,   :desc => "拼车周期", :required => false 
    param :line_remark,                   String,   :desc => "拼车追加需求", :required => false
  end


  # GET /pzz_lines
  # GET /pzz_lines.json
  api :GET, '/pzz_lines', "返回所有的线路"
  api :GET, '/pzz_lines.json', "返回所有的线路（JSON）"
  param_group :kaminari
  def index
    @pzz_lines = PzzLine.where(line_status: PzzLine.line_statuses[:open]).
    page(params[:page]).per(params[:per_page]).order(created_at: :desc)
  end

  # GET /pzz_users/:pzz_user_id/pzz_lines
  # GET /pzz_users/:pzz_user_id/pzz_lines.json
  api :GET, '/pzz_users/:pzz_user_id/pzz_lines', "返回指定用户的所有线路"
  api :GET, '/pzz_users/:pzz_user_id/pzz_lines.json', "返回指定用户的所有线路（JSON）"
  param_group :kaminari
  def user_lines
    @pzz_lines = PzzLine.where(params[:pzz_user_id]).
    where.not(line_status: PzzLine.line_statuses[:canceled]).
    page(params[:page]).per(params[:per_page]).
    order(created_at: :desc)
    respond_to do |format|
      format.json { render json: @pzz_lines}
    end
  end


  # GET /pzz_lines/1
  # GET /pzz_lines/1.json
  api :GET, '/pzz_lines/:id', "根据ID获取指定的线路"
  api :GET, '/pzz_lines/:id.json', "根据ID获取指定的线路（JSON）"
  param :id, :number
  def show
    @pzz_line = PzzLine.find(params[:id])
    respond_to do |format|
      format.html { super }
      format.json {
        if @pzz_line.nil?
          head :not_found
        else
          render json: JSON::parse(@pzz_line.to_json).merge("extras" => { "line_intro" => "#{PzzLine.tell_line(@pzz_line)}", 
            "user_avatar_url" => @pzz_line.pzz_user.user_avatar.url(:thumb)}).to_json 
        end
      }
    end
  end

  # GET /pzz_lines/new
  def new
    @pzz_line = PzzLine.new
  end

  # GET /pzz_lines/1/edit
  def edit
  end


  # 需判断是否已进行实名认证或驾驶认证
  # POST /pzz_users/:pzz_user_id/pzz_lines
  # POST /pzz_users/:pzz_user_id/pzz_lines.json
  api :POST, '/pzz_users/:pzz_user_id/pzz_lines', '发布线路'
  api :POST, '/pzz_users/:pzz_user_id/pzz_lines.json', '发布线路（JSON）'
  def create

    begin
      format = '%Y-%m-%d %H:%M:%S'
      depart_at_formatted  = DateTime.parse(pzz_line_params[:line_depart_datetime].to_s).strftime(format)
      return_at_formatted  = DateTime.parse(pzz_line_params[:line_return_datetime].to_s).strftime(format)

      pzz_line_params[:line_depart_datetime] = depart_at_formatted
      pzz_line_params[:line_return_datetime] = return_at_formatted
      pzz_line_params[:line_expire_datetime] = depart_at_formatted #如果到了出发日期还没有关闭的话就自动过期
  rescue => e
      logger.error "pzz_line_controller::create => exception #{e.class.name} : #{e.message}"
      # redirect somewhere sensible?
      head :unprocessable_entity
      return
    end

    # line_participants_available  司机剩余座位数
    # line_participants  乘客申请（司机提供）的座位数

    @pzz_line = PzzLine.new(pzz_line_params)
    @pzz_line.line_participants_available = pzz_line_params[:line_participants]

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

  # PATCH/PUT /pzz_users/:pzz_user_id/pzz_lines/1
  # PATCH/PUT /pzz_users/:pzz_user_id/pzz_lines/1.json
  api :PUT, '/pzz_users/:pzz_user_id/pzz_lines/1', '修改指定线路'
  api :PUT, '/pzz_users/:pzz_user_id/pzz_lines/1.json', '修改指定线路（JSON）'
  param :line_status,                  Integer, desc: "线路状态", required: false
  param :line_participants_available,  Integer, desc: "司机提供座位数", required: false
  param :line_participants,            Integer, desc: "乘客拼车座位数", required: false
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

  api :DELETE, '/pzz_users/:pzz_user_id/pzz_lines/1', '取消指定线路'
  api :DELETE, '/pzz_users/:pzz_user_id/pzz_lines/1.json', '取消指定线路（JSON）'
  # DELETE /pzz_users/:pzz_user_id/pzz_lines/1
  # DELETE /pzz_users/:pzz_user_id/pzz_lines/1.json
  def destroy
    #@pzz_line.destroy

    @pzz_line.canceled!

    respond_to do |format|
      format.html { redirect_to pzz_lines_url, notice: 'Pzz line was successfully canceled.' }
      format.json { head :no_content }
    end
  end


  api :POST, '/pzz_lines/search', '返回所有满足筛选条件的线路'
  api :POST, '/pzz_lines/search.json', '返回所有满足筛选条件的线路（JSON）'
  param_group :kaminari
  param_group :pzz_line
  def search
    respond_to do |format|
      format.json { render json: PzzLine.where(params[:pzz_line]).
        where.not(line_status: PzzLine.line_statuses[:canceled])
        .page(params[:page]).per(params[:per_page]).order(created_at: :desc) }
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
