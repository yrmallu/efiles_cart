class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_admin
  layout 'admin'

  private
  def validate_admin
    redirect_to root_path unless current_user.admin_role
  end
end
