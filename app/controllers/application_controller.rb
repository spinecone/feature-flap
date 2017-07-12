class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include GitHub::SSO::Rails::ControllerHelpers

  helper_method :current_user, :current_user=

  private

  def verify_logged_in_user
    # github_sso_session_valid? forces an OAuth handshake if it can't verify the browser session
    # The below code verifies that the session was valid on github.com in the last 30 seconds
    unless current_user
      redirect_to "/auth/githubber"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    session[:user_id] = user.id
  end
end
