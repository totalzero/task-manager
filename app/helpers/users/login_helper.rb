module Users::LoginHelper
  def login_user(user)
    session[:current_user] = user.id
end

  def logout_user
session.delete[:current_user]
  end

  def current_user
User.find_by(id: session[:current_user])
  end

  def user_logged?
    ! session[:current_user].nil?
  end
end
