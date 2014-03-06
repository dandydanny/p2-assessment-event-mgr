post'/signup' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  @user.birthdate = params[:birthdate]
  @user.save!
  session[:user_id] = @user.id
  redirect('/dashboard')
end

post '/' do
  @email = params[:email]
  @password = params[:password]
  @user = User.authenticate(@email,@password)

  if @user
    session[:user_id] = @user.id
    redirect('/dashboard')
  else
    @error = "Unable to login. Please check your username / password."
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect('/')
end

get '/dashboard' do
  if current_user
    @attendances = attended_events
    @events = Event.all
    erb :dashboard
  else
    @error = "Please login first."
    erb :index
  end
end
