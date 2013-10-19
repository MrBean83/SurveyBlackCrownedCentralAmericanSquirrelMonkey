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

get '/complete_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :complete_survey
end

post '/complete_survey/:survey_id' do
  params[:q_r].each do |qr|
    response = qr[1]
  user_response = Userresponse.create(user_id: session[:user_id],
                                                              response_id: response)
  completed_survey = Completedsurvey.create(user_id: session[:user_id],
                                                                          survey_id: params[:survey_id])
  redirect "/surveystaken/#{params[:survey_id]}"
end
end
