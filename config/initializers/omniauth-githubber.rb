Rails.application.config.middleware.use OmniAuth::Builder do
  provider :githubber, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], scope: 'user'
end