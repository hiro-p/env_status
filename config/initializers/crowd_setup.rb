crowd_server_url = ENV['crowd_server_url'], 
application_name = ENV['application_name'], 
application_password = ENV['application_password']

if not Rails.env.production?
  crowd_server_url = "http://localhost" #crowd requires a valid URL even in test

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:crowd] = OmniAuth::AuthHash.new({
    :provider => 'crowd',
    :uid => '123545',
    :user_info => {:name => "dev"}
  })
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :crowd, 
  	:crowd_server_url=> crowd_server_url, 
  	:application_name=> application_name, 
  	:application_password=> application_password
end

OmniAuth.config.on_failure = SessionsController.action(:failure)

