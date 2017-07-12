class AdminAuthenticatedConstraint
  def matches?(request)
    user_id = request.session[:user_id]
    return false if user_id.blank?

    user = User.find(user_id)
    user && user.admin?(1) # lol
  end
end