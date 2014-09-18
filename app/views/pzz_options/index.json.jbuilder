json.array!(@pzz_options) do |pzz_option|
  json.extract! pzz_option, :id, :option_name, :option_value, :autoload
  json.url pzz_option_url(pzz_option, format: :json)
end
