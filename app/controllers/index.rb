get '/' do
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:user_id] = @user.id
    redirect '/profile'
  else
    redirect '/'
  end
end

get '/create_survey' do
  erb :create_survey
end

post '/create_survey' do
  # BETTER WAY TO CREATE SURVEY
  redirect '/profile'
end

get '/complete_survey/:id' do
  @survey = Survey.find(params[:id])
  erb :complete_survey
end
