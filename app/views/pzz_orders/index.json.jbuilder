json.array!(@pzz_orders) do |pzz_order|
  json.extract! pzz_order, :id, :order_no, :passenger_id, :driver_id, :pzz_line_id, :passenger_nickname, :passenger_realname, :passenger_phone, :passenger_email, :driver_nickname, :driver_realname, :driver_phone, :driver_email, :order_participants, :order_status, :order_remark
  json.url pzz_order_url(pzz_order, format: :json)
end
