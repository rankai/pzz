json.array!(@pzz_links) do |pzz_link|
  json.extract! pzz_link, :id, :pzz_user_id, :link_url, :link_name, :link_image, :link_target, :link_description, :link_visible, :link_rating, :link_rel, :link_notes, :link_rss
  json.url pzz_link_url(pzz_link, format: :json)
end
