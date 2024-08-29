module Users::LoginHelper
  def login_user(user)
    session[:current_user] = user.id
    puts "uzytkownik zostal pomyslnie dodany do sesji"
  end

  def logout_user
session[:current_user]     = nil
  end

  def current_user
User.find_by(id: session[:current_user])
  end

  def user_logged?
    ! session[:current_user].nil?
  end
end
