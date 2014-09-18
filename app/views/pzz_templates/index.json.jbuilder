json.array!(@pzz_templates) do |pzz_template|
  json.extract! pzz_template, :id, :template_key, :template_value, :template_type
  json.url pzz_template_url(pzz_template, format: :json)
end
