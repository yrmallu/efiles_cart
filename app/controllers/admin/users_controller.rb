class Admin::UsersController < Admin::BaseController

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.where(admin_role: false)
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    user = User.find(params[:id])
    user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
