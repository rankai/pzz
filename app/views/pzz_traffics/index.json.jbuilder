json.array!(@pzz_traffics) do |pzz_traffic|
  json.extract! pzz_traffic, :id, :pzz_user_id, :traffic_keywords, :traffic_image, :traffic_description, :traffic_gps
  json.url pzz_traffic_url(pzz_traffic, format: :json)
end
