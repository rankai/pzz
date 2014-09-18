json.array!(@pzz_term_taxonomies) do |pzz_term_taxonomy|
  json.extract! pzz_term_taxonomy, :id, :pzz_term_id, :taxonomy_name, :taxonomy_description, :taxonomy_parent_id, :count
  json.url pzz_term_taxonomy_url(pzz_term_taxonomy, format: :json)
end
