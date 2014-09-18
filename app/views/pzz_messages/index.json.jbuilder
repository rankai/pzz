json.array!(@pzz_messages) do |pzz_message|
  json.extract! pzz_message, :id, :from_user_id, :to_user_id, :from_user_nickname, :message_subject, :message_content, :message_folder, :message_related_id, :message_status, :message_type
  json.url pzz_message_url(pzz_message, format: :json)
end
