class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
    end
  end

  def set_coder_cola
    @coder_cola ||= Product.find_by_name('Coder Cola Case')
  end

  def set_orders
    @orders ||= Order.limit(7).order(created_at: :desc)
  end

  def verify_admin
    if !current_user || !current_user.admin?
      redirect_to root_path, flash: { error: "You don't have permission to view this page!" }
    end
  end
end
