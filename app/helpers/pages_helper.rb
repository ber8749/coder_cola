module PagesHelper
  def user_view
    user_signed_in? ? 'pages/orders' : 'pages/user_address_form'
  end
end
