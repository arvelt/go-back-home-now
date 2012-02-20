Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'aLLC79cZvRHKe8jawQaGA', 'CMQp4Azbz1ad8bMcVqwQF0kmEE4MixkQpciqPmDc'
  provider :google_oauth2, '40217307146.apps.googleusercontent.com' , 'AkFXU4w7dWWbmth-Be_DeFcX'
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

