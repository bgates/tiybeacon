class StartController < ApplicationController
  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/event-stream'

    sse = JsonSSE.new(response.stream)

    Attendance.raw.changes.each do |change|
      sse.write(attendances_presenter.as_json)
    end
  rescue *client_disconnected
  ensure
    sse.close rescue nil
    NoBrainer.disconnect rescue nil
  end

private

  def client_disconnected
    return ActionController::Live::ClientDisconnected, IOError
  end

end
