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
  binding.pry
  Survey.create(name: params[:survey_name], user_id: session[:user_id])
  # BETTER WAY TO CREATE SURVEY
  # Create survey (user_id, name)
  # for each question
  # create the question (survey_id, content)
  # create the responses (question_id, survey_id, content)
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
