class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  def not_authenticated
    redirect_to login_url, warning: t('defaults.login_alert')
  end
end
