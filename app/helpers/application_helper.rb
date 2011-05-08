module ApplicationHelper
  
  def sign_out_path
    return destroy_user_session_path if user_signed_in?
    return destroy_admin_session_path if admin_signed_in?
  end
  
  def admin_or_user
    return "user" if user_signed_in?
    return "admin" if admin_signed_in?
  end
  
end
