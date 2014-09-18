require 'test_helper'

class PzzOrdersControllerTest < ActionController::TestCase
  setup do
    @pzz_order = pzz_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_order" do
    assert_difference('PzzOrder.count') do
      post :create, pzz_order: { driver_email: @pzz_order.driver_email, driver_id: @pzz_order.driver_id, driver_nickname: @pzz_order.driver_nickname, driver_phone: @pzz_order.driver_phone, driver_realname: @pzz_order.driver_realname, line_id: @pzz_order.line_id, order_no: @pzz_order.order_no, order_participants: @pzz_order.order_participants, order_remark: @pzz_order.order_remark, order_status: @pzz_order.order_status, passenger_email: @pzz_order.passenger_email, passenger_id: @pzz_order.passenger_id, passenger_nickname: @pzz_order.passenger_nickname, passenger_phone: @pzz_order.passenger_phone, passenger_realname: @pzz_order.passenger_realname }
    end

    assert_redirected_to pzz_order_path(assigns(:pzz_order))
  end

  test "should show pzz_order" do
    get :show, id: @pzz_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_order
    assert_response :success
  end

  test "should update pzz_order" do
    patch :update, id: @pzz_order, pzz_order: { driver_email: @pzz_order.driver_email, driver_id: @pzz_order.driver_id, driver_nickname: @pzz_order.driver_nickname, driver_phone: @pzz_order.driver_phone, driver_realname: @pzz_order.driver_realname, line_id: @pzz_order.line_id, order_no: @pzz_order.order_no, order_participants: @pzz_order.order_participants, order_remark: @pzz_order.order_remark, order_status: @pzz_order.order_status, passenger_email: @pzz_order.passenger_email, passenger_id: @pzz_order.passenger_id, passenger_nickname: @pzz_order.passenger_nickname, passenger_phone: @pzz_order.passenger_phone, passenger_realname: @pzz_order.passenger_realname }
    assert_redirected_to pzz_order_path(assigns(:pzz_order))
  end

  test "should destroy pzz_order" do
    assert_difference('PzzOrder.count', -1) do
      delete :destroy, id: @pzz_order
    end

    assert_redirected_to pzz_orders_path
  end
end
