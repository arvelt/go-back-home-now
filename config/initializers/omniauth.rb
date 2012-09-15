Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :twitter, 'aLLC79cZvRHKe8jawQaGA', 'CMQp4Azbz1ad8bMcVqwQF0kmEE4MixkQpciqPmDc'
  provider :twitter, 
    File.read("config/initializers/twitter_id",:encoding=>Encoding::UTF_8), 
    File.read("config/initializers/twitter_secret",:encoding=>Encoding::UTF_8)
#  provider :google_oauth2, '40217307146.apps.googleusercontent.com' , 'AkFXU4w7dWWbmth-Be_DeFcX'
  provider :google_oauth2, 
    File.read("config/initializers/google_id",:encoding=>Encoding::UTF_8) , 
    File.read("config/initializers/google_secret",:encoding=>Encoding::UTF_8)
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

