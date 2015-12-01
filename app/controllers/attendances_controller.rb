class AttendancesController < ApplicationController
  before_action :set_user, except: :index
  before_action :set_attendance, only: :destroy

  def index
    @attendances = attendances_presenter
    render display_as_mobile? ? :mobile_index : :index
  end

  def create
    Attendance.create(user_id: @current_user.id)
    head :no_content
  end

  def destroy
    @attendance.destroy
    head :no_content
  end
private

  def set_attendance
    @attendance = @current_user.attendances.find(params[:id])
  end

  def set_user
    @current_user ||= User.find(session[:user_id])
  end
end
