Rails.application.config.middleware.use OmniAuth::Builder do
  provider :crowd, 
  	:crowd_server_url=>ENV['crowd_server_url'], 
  	:application_name=>ENV['application_name'], 
  	:application_password=>ENV['application_password']
end

OmniAuth.config.on_failure = SessionsController.action(:failure)