Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :developer unless Rails.env.production?
    # provider :github, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
    # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  end