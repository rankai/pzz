class PzzOrdersController < ApplicationController
  before_action :set_pzz_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_pzz_user!

  # GET /pzz_orders
  # GET /pzz_orders.json
  def index
    @pzz_orders = PzzOrder.all
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

  # POST /pzz_orders
  # POST /pzz_orders.json
  def create
    @pzz_order = PzzOrder.new(pzz_order_params)

    respond_to do |format|
      if @pzz_order.save
        format.html { redirect_to @pzz_order, notice: 'Pzz order was successfully created.' }
        format.json { render :show, status: :created, location: @pzz_order }
      else
        format.html { render :new }
        format.json { render json: @pzz_order.errors, status: :unprocessable_entity }
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

  # DELETE /pzz_orders/1
  # DELETE /pzz_orders/1.json
  def destroy
    @pzz_order.destroy
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
