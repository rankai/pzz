require 'test_helper'

class PzzCaRsControllerTest < ActionController::TestCase
  setup do
    @pzz_car = pzz_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_car" do
    assert_difference('PzzCar.count') do
      post :create, pzz_car: { car_brand_name: @pzz_car.car_brand_name, car_engine_no: @pzz_car.car_engine_no, car_plate_no: @pzz_car.car_plate_no, car_seats: @pzz_car.car_seats, car_type: @pzz_car.car_type, car_vin: @pzz_car.car_vin, identity_remark: @pzz_car.identity_remark, identity_status: @pzz_car.identity_status, identity_vl_image: @pzz_car.identity_vl_image, identity_vl_issued: @pzz_car.identity_vl_issued, identity_vl_no: @pzz_car.identity_vl_no, insurance_corporate: @pzz_car.insurance_corporate, insurance_expired: @pzz_car.insurance_expired, insurance_image: @pzz_car.insurance_image, insurance_no: @pzz_car.insurance_no, pzz_driver_identity_id: @pzz_car.pzz_driver_identity_id, pzz_user_id: @pzz_car.pzz_user_id, user_realname: @pzz_car.user_realname }
    end

    assert_redirected_to pzz_car_path(assigns(:pzz_car))
  end

  test "should show pzz_car" do
    get :show, id: @pzz_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_car
    assert_response :success
  end

  test "should update pzz_car" do
    patch :update, id: @pzz_car, pzz_car: { car_brand_name: @pzz_car.car_brand_name, car_engine_no: @pzz_car.car_engine_no, car_plate_no: @pzz_car.car_plate_no, car_seats: @pzz_car.car_seats, car_type: @pzz_car.car_type, car_vin: @pzz_car.car_vin, identity_remark: @pzz_car.identity_remark, identity_status: @pzz_car.identity_status, identity_vl_image: @pzz_car.identity_vl_image, identity_vl_issued: @pzz_car.identity_vl_issued, identity_vl_no: @pzz_car.identity_vl_no, insurance_corporate: @pzz_car.insurance_corporate, insurance_expired: @pzz_car.insurance_expired, insurance_image: @pzz_car.insurance_image, insurance_no: @pzz_car.insurance_no, pzz_driver_identity_id: @pzz_car.pzz_driver_identity_id, pzz_user_id: @pzz_car.pzz_user_id, user_realname: @pzz_car.user_realname }
    assert_redirected_to pzz_car_path(assigns(:pzz_car))
  end

  test "should destroy pzz_car" do
    assert_difference('PzzCar.count', -1) do
      delete :destroy, id: @pzz_car
    end

    assert_redirected_to pzz_cars_path
  end
end
