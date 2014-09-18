json.array!(@pzz_cars) do |pzz_car|
  json.extract! pzz_car, :id, :pzz_user_id, :pzz_driver_identity_id, :user_realname, :car_type, :car_brand_name, :car_seats, :car_plate_no, :car_vin, :car_engine_no, :identity_vl_no, :identity_vl_image, :identity_vl_issued, :insurance_corporate, :insurance_no, :insurance_expired, :insurance_image, :identity_status, :identity_remark
  json.url pzz_car_url(pzz_car, format: :json)
end
