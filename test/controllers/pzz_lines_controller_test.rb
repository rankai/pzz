require 'test_helper'

class PzzLinesControllerTest < ActionController::TestCase
  setup do
    @pzz_line = pzz_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_line" do
    assert_difference('PzzLine.count') do
      post :create, pzz_line: { line_depart_address: @pzz_line.line_depart_address, line_depart_city: @pzz_line.line_depart_city, line_depart_datetime: @pzz_line.line_depart_datetime, line_depart_gps: @pzz_line.line_depart_gps, line_dest_address: @pzz_line.line_dest_address, line_dest_city: @pzz_line.line_dest_city, line_dest_gps: @pzz_line.line_dest_gps, line_elapse: @pzz_line.line_elapse, line_expire_datetime: @pzz_line.line_expire_datetime, line_fuel: @pzz_line.line_fuel, line_midway: @pzz_line.line_midway, line_milleage: @pzz_line.line_milleage, line_participants: @pzz_line.line_participants, line_participants_available: @pzz_line.line_participants_available, line_plan_type: @pzz_line.line_plan_type, line_price: @pzz_line.line_price, line_remark: @pzz_line.line_remark, line_return: @pzz_line.line_return, line_return_datetime: @pzz_line.line_return_datetime, line_status: @pzz_line.line_status, line_type: @pzz_line.line_type, line_week_day: @pzz_line.line_week_day, user_email: @pzz_line.user_email, user_id: @pzz_line.user_id, user_nickname: @pzz_line.user_nickname, user_phone: @pzz_line.user_phone, user_realname: @pzz_line.user_realname, user_type: @pzz_line.user_type }
    end

    assert_redirected_to pzz_line_path(assigns(:pzz_line))
  end

  test "should show pzz_line" do
    get :show, id: @pzz_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_line
    assert_response :success
  end

  test "should update pzz_line" do
    patch :update, id: @pzz_line, pzz_line: { line_depart_address: @pzz_line.line_depart_address, line_depart_city: @pzz_line.line_depart_city, line_depart_datetime: @pzz_line.line_depart_datetime, line_depart_gps: @pzz_line.line_depart_gps, line_dest_address: @pzz_line.line_dest_address, line_dest_city: @pzz_line.line_dest_city, line_dest_gps: @pzz_line.line_dest_gps, line_elapse: @pzz_line.line_elapse, line_expire_datetime: @pzz_line.line_expire_datetime, line_fuel: @pzz_line.line_fuel, line_midway: @pzz_line.line_midway, line_milleage: @pzz_line.line_milleage, line_participants: @pzz_line.line_participants, line_participants_available: @pzz_line.line_participants_available, line_plan_type: @pzz_line.line_plan_type, line_price: @pzz_line.line_price, line_remark: @pzz_line.line_remark, line_return: @pzz_line.line_return, line_return_datetime: @pzz_line.line_return_datetime, line_status: @pzz_line.line_status, line_type: @pzz_line.line_type, line_week_day: @pzz_line.line_week_day, user_email: @pzz_line.user_email, user_id: @pzz_line.user_id, user_nickname: @pzz_line.user_nickname, user_phone: @pzz_line.user_phone, user_realname: @pzz_line.user_realname, user_type: @pzz_line.user_type }
    assert_redirected_to pzz_line_path(assigns(:pzz_line))
  end

  test "should destroy pzz_line" do
    assert_difference('PzzLine.count', -1) do
      delete :destroy, id: @pzz_line
    end

    assert_redirected_to pzz_lines_path
  end
end
