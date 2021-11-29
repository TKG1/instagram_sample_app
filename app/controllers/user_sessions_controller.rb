class UserSessionsController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      redirect_back_or_to posts_path, success: t('.login_success')
    else
      flash.now[:danger] = (t('.login_fail'))
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout_success')
  end
end
