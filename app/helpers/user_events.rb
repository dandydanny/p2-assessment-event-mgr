helpers do
  # Return a list of events created by the current_user
  def created_events
    Event.where(user_id: current_user.id)
  end

  # Return a list of events attended by the current_user
  def attended_events
    EventAttendance.where(user_id: current_user.id)
  end
end
