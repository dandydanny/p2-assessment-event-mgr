get '/create_event' do
  erb :create_event
end

post '/create_event' do
  p params
  p params[:name]
  p params[:start_time]

  Event.create( user_id:   current_user.id,
                name:      params[:name],
                location:  params[:location],
                starts_at: params[:start_time],
                ends_at:   params[:end_time])
  redirect('/dashboard')
end

get '/your_events' do
  if current_user
    @events = created_events
    @attendances = attended_events
    erb :your_events
  else
    @error = "Please login first."
    erb :index
  end
end

get '/attended_events' do
  if current_user
    @events = attended_events
    erb :attended_events
  else
    @error = "Please login first."
    erb :index
  end
end

get '/attend_event/:event_id' do
  EventAttendance.create(user_id: current_user.id, event_id: params[:event_id])
  redirect('/dashboard')
end

get '/cancel_event/:event_id' do
  Event.find(params[:event_id]).destroy
  redirect('/your_events')
end

get '/edit_event/:event_id' do
  @event = Event.find(params[:event_id])
  erb :edit_event
end

post '/edit_event/:event_id' do
  @event = Event.find(params[:event_id])
  @event.update_attributes(name: params[:name], location: params[:location], starts_at: params[:starts_at], ends_at: params[:ends_at])
  redirect('/dashboard')
end
