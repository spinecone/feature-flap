class SessionsController < ApplicationController

  def create
    puts "the info is #{request.env['omniauth.auth']}"
    @user = User.find_for_githubber_oauth(request.env['omniauth.auth'])

    if @user && @user.persisted?
      # This method stores params[:browser_session_id] to the session for later verification.
      # This value is only sent to GitHub owned applications.
      github_sso_session_store!
      self.current_user = @user
      redirect_to root_path
    else
      render status: 403, text: 'Auth Failed'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
