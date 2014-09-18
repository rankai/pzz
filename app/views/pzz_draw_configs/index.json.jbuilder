json.array!(@pzz_draw_configs) do |pzz_draw_config|
  json.extract! pzz_draw_config, :id, :draw_title, :draw_description, :draw_starttime, :draw_endtime, :user_filter, :draw_count, :draw_type, :draw_status
  json.url pzz_draw_config_url(pzz_draw_config, format: :json)
end
