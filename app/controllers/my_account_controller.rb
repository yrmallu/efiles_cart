class MyAccountController < ApplicationController
  layout :set_layout

  # GET my account page
  def index; end

  # GET user password change form
  def change_password; end

  private
  def set_layout
    current_user.present? && current_user.admin_role ? 'admin' : 'application'
  end
end
