class User < ApplicationRecord
  def self.find_for_githubber_oauth(access_token, signed_in_resource=nil)

    info = access_token.info
    github_id = access_token.uid

    user = where(github_id: github_id).first_or_initialize

    if user
      user.github_authentication_token = access_token.credentials.token
    end

    if user.new_record?
      user.name  = info.name
      user.email = info.email
      user.login = info.nickname
    end

    user.save

    user
  end

  # Used by flipper to check if a user is an admin.
  # All users are admins!
  # Please, take my keys...
  def admin?(_)
    true
  end

  # Flipper needs users to respond to flipper_id
  def flipper_id
    id
  end
end
