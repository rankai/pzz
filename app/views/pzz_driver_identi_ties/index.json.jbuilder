json.array!(@pzz_driver_identities) do |pzz_driver_identity|
  json.extract! pzz_driver_identity, :id, :pzz_user_id, :user_realname, :identity_dl_no, :identity_dl_image, :identity_dl_type, :identity_dl_issued, :identity_dl_status, :identity_status, :indentity_remark
  json.url pzz_driver_identity_url(pzz_driver_identity, format: :json)
end
