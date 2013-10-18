get '/profile' do
erb :user_profile
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :survey_results
end

post '/login' do
  user = User.find_by_name(params[:username])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect to '/profile'
  else
    session.clear
    redirect  to '/'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end
