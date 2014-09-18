json.array!(@pzz_comments) do |pzz_comment|
  json.extract! pzz_comment, :id, :pzz_user_id, :pzz_post_id, :user_email, :user_url, :user_ip, :comment_content, :comment_approved, :user_agent, :comment_parent_id
  json.url pzz_comment_url(pzz_comment, format: :json)
end
