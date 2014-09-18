json.array!(@pzz_lines) do |pzz_line|
  json.extract! pzz_line, :id, :pzz_user_id, :user_nickname, :user_realname, :user_phone, :user_email, :user_type, :line_type, :line_depart_datetime, :line_return, :line_return_datetime, :line_participants, :line_participants_available, :line_status, :line_price, :line_depart_city, :line_depart_address, :line_depart_gps, :line_dest_city, :line_dest_address, :line_dest_gps, :line_midway, :line_milleage, :line_elapse, :line_fuel, :line_expire_datetime, :line_plan_type, :line_week_day, :line_remark
  json.url pzz_line_url(pzz_line, format: :json)
end
