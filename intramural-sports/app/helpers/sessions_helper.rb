module SessionsHelper
  def logged_in?
    current_user = session[:id]
  end
end
