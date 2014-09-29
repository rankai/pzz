class PzzOrdersController < ApplicationController
  before_action :set_pzz_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_pzz_user!

  wrap_parameters PzzOrder

  # GET /pzz_orders
  # GET /pzz_orders.json
  def index
    @pzz_orders = PzzOrder.page(params[:page]).per(params[:per_page]).
    order(created_at: :desc)
  end

  # GET /pzz_orders/1
  # GET /pzz_orders/1.json
  def show
  end

  # GET /pzz_orders/new
  def new
    @pzz_order = PzzOrder.new
  end

  # GET /pzz_orders/1/edit
  def edit
  end

  # POST /pzz_users/:pzz_user_id/pzz_orders
  # POST /pzz_users/:pzz_user_id/pzz_orders.json
  api :POST, '/pzz_users/:pzz_user_id/pzz_orders', '申请（或邀请）加入拼车'
  api :POST, '/pzz_users/:pzz_user_id/pzz_orders.json', '申请（或邀请）加入拼车（JSON）'
  param :pzz_line_id,       Integer, desc: '线路ID', required: true
  param :pzz_user_id,       Integer, desc: '申请（或邀请）人ID', required: true
  param :line_participants, Integer, desc: '申请的座位数', required: true
  def create
    # @pzz_order = PzzOrder.new(pzz_order_params)
    line    = PzzLine.find(params[:pzz_line_id])
    applier = PzzUser.find(params[:pzz_user_id])
    participants = params[:line_participants].to_i

    @pzz_order = PzzOrder.create_order(line, applier, participants)

    respond_to do |format|

      if @pzz_order == 405
        # 需要完成相关拼车认证
        # 座位不足
        format.html { render :new }
        format.json { head :method_not_allowed }
      elsif @pzz_order == 500
        format.html { render :new }
        format.json { head :internal_error } # 无法成功匹配线路
      end

      if @pzz_order.nil?
        format.html { render :new }
        format.json { render json: @pzz_order.errors, status: :unprocessable_entity } # 无法创建订单 422
      else
        format.html { redirect_to @pzz_order, notice: 'Pzz order was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_order }
      end

    end
  end

  # PATCH/PUT /pzz_orders/1
  # PATCH/PUT /pzz_orders/1.json
  def update
    respond_to do |format|
      if @pzz_order.update(pzz_order_params)
        format.html { redirect_to @pzz_order, notice: 'Pzz order was successfully updated.' }
        format.json { render :show, status: :ok, location: @pzz_order }
      else
        format.html { render :edit }
        format.json { render json: @pzz_order.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /pzz_users/:pzz_user_id/pzz_orders/1/confirm
  # PATCH/PUT /pzz_users/:pzz_user_id/pzz_orders/1/confirm.json
  api :PUT, '/pzz_users/:pzz_user_id/pzz_orders/:id/confirm', '同意加入拼车'
  api :PUT, '/pzz_users/:pzz_user_id/pzz_orders/:id/confirm.json', '同意加入拼车（JSON）'
  def confirm
    user = PzzUser.find(params[:pzz_user_id])
    order = PzzOrder.find(params[:id])

    respond_to do |format|

        if order.passenger_id != user.id || order.driver_id != user.id
          format.json {head :unprocessable_entity} # 订单与请求用户不匹配
        else
          order.confirmed!
          format.json {head :no_content}

        end

    end

  end


  # DELETE /pzz_users/:pzz_user_id/pzz_orders/1
  # DELETE /pzz_users/:pzz_user_id/pzz_orders/1.json
  api :DELETE, '/pzz_users/:pzz_user_id/pzz_orders/:id', '取消订单'
  api :DELETE, '/pzz_users/:pzz_user_id/pzz_orders/:id.json', '取消订单（JSON）'
  def destroy
    #@pzz_order.destroy
    @pzz_order.canceled!
    respond_to do |format|
      format.html { redirect_to pzz_orders_url, notice: 'Pzz order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pzz_order
      @pzz_order = PzzOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pzz_order_params
      params.require(:pzz_order).permit(:order_no, :passenger_id, :driver_id, :line_id, :passenger_nickname, :passenger_realname, :passenger_phone, :passenger_email, :driver_nickname, :driver_realname, :driver_phone, :driver_email, :order_participants, :order_status, :order_remark)
    end
end
