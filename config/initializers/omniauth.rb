Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET']
end

if Rails.env == "development"
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = {
    "provider" => "google",
    "uid" => 4580841,
    "info" => {
      "name" => "Arvelt S",
    },
  }
end

