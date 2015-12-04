class AttendancePresenter < Presenter

  def as_json(*)
    {
      id:   @object.id,
      name: @object.name,
      time: @object.created_at.strftime("%I:%M:%S"),
      avatar_url: @object.avatar_url
    }
  end
end
