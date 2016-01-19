module PagesHelper
  def user_view
    user_signed_in? ? 'orders/dashboard' : 'users/form'
  end
end
