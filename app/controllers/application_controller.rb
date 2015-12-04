class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

private

  def attendances_presenter
    AttendancesPresenter.new(Attendance.includes(:user).all).as_json
  end

  def check_for_mobile
    session[:mobile_override] = params[:mobile] unless params[:mobile].blank?
  end

  def display_as_mobile?
    session[:mobile_override] || mobile_device?
  end

  def mobile_device?
    # Season this regexp to taste. I prefer to treat iPad as non-mobile.
    request.user_agent =~ /Mobile|webOS/ && request.user_agent !~ /iPad/
  end
  helper_method :display_as_mobile?
end
