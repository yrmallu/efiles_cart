module SpecTestHelper
  def login_admin
    admin = FactoryGirl.create(:user, :admin)
    login(admin)
  end

  def login(user)
    #user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    sign_in user
    request.session[:user] = user.id
  end

  def current_user
    User.find(request.session[:user])
  end
end
