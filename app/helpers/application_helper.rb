module ApplicationHelper

  FLASH_ALERT_CLASSES = { success: 'success', notice: 'info', alert: 'warning', error: 'danger',  }

  def body_classes
    "#{action_name} #{controller_name}"
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def flash_messages
    flash.each do |key,value|
      concat(content_tag(:div, value, class: flash_message_class(key)))
    end
  end

  def flash_message_class(key)
    "alert alert-#{FLASH_ALERT_CLASSES[key.to_sym]} text-center"
  end

  def login_or_logout_link
    if user_signed_in?
      link_to('Logout', destroy_user_session_path, :method => :delete)
    else
      link_to('Login', new_user_session_path)
    end
  end

  # necessary devise helper for user registration
  def resource_name
    :user
  end

  # necessary devise helper for user registration
  def resource
    @resource ||= User.new
  end
end
