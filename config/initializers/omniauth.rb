OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET']
end

OmniAuth.config.on_failure = -> (env) do
  Rack::Response.new(['302 Moved'], 302, 'Location' => env['omniauth.origin'] || "/").finish
end