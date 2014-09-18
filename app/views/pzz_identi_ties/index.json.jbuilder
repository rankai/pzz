json.array!(@pzz_identities) do |pzz_identity|
  json.extract! pzz_identity, :id, :pzz_user_id, :user_realname, :user_gender, :identity_card_no, :identity_image, :identity_status, :identity_remark
  json.url pzz_identity_url(pzz_identity, format: :json)
end
