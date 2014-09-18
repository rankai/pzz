json.array!(@pzz_posts) do |pzz_post|
  json.extract! pzz_post, :id, :pzz_user_id, :post_title, :post_name, :post_content, :post_excerpt, :post_status, :comment_status, :post_content_filtered, :comment_count, :post_order, :post_guid, :to_ping, :pinged, :ping_status
  json.url pzz_post_url(pzz_post, format: :json)
end
