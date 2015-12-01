class AttendancesPresenter < Presenter

  def as_json(*)
    {
      attendances: @object.map{|o| AttendancePresenter.new(o).as_json }
    }
  end
end
