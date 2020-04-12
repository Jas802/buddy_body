Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['1009680652149-k3i0f796guc2veoj1hp7prcijp0e8jrl.apps.googleusercontent.com'], ENV['5h5Ljmy3dp9g4zAz9p50-UFh']
  end