class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  layout :set_layout

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?
      @user.update_with_password(account_update_params)
    else
      @user.update_without_password(account_update_params)
    end

    if successfully_updated
      set_flash_message :notice, :updated
      bypass_sign_in @user
      redirect_to my_account_path
    else
      render 'edit'
    end
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :cellphone, :country_code_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    keys = [:name, :email, :password, :current_password, :password_confirmation, :cellphone, :country_code_id]
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end

  def needs_password?
    params[:user][:password].present?
  end

  def set_layout
    current_user.present? && current_user.admin_role ? 'admin' : 'application'
  end
end
