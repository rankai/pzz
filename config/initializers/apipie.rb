Apipie.configure do |config|
  config.app_name                = "Pzz"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  # config.authenticate = Proc.new do
  #    authenticate_or_request_with_http_basic do |username, password|
  #      username == "18612696688" && password == "111"
  #   end
  # end
  # where is your API defined?
  config.api_controllers_matcher = ["#{Rails.root}/app/controllers/*.rb", "#{Rails.root}/app/controllers/pzz_users/*.rb"]
end
