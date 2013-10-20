get '/' do
  if session[:user_id]
    redirect to '/profile'
  else
    erb :index
  end
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
  @survey = Survey.create(name: params[:survey_name], user_id: session[:user_id])
  params.each do |question, content_hash|
    if content_hash.class == Hash
      content_hash.each do |key, value|
        if key == "question"
          @question = Question.create(survey_id: @survey.id, content: value)
        else
          Response.create(question_id: @question.id, survey_id: @survey.id, content: value)
        end
      end
    end
  end

  redirect '/profile'
end

get '/complete_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :complete_survey
end

post '/complete_survey/:survey_id' do
  params[:q_r].each do |q, r|
    response = r
    user_response = Userresponse.create(user_id: session[:user_id],
      response_id: response)
    completed_survey = Completedsurvey.create(user_id: session[:user_id],
      survey_id: params[:survey_id])
  end
  redirect "/surveystaken/#{params[:survey_id]}"
end

