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
  Survey.create(name: params[:survey_name])
  
  # BETTER WAY TO CREATE SURVEY
  # Create survey (user_id, name)
  # for each question
  # create the question (survey_id, content)
  # create the responses (question_id, survey_id, content)
  redirect '/profile'
end

get '/complete_survey/:id' do
  @survey = Survey.find(params[:id])
  erb :complete_survey
end
