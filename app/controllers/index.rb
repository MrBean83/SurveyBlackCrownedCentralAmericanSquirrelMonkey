get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  @user = User.new(params[:user])
  redirect '/profile'
end

get '/create_survey' do
  erb :create_survey
end

post '/create_survey' do
  @survey = Survey.create(params[:survey], user_id: session[:user_id])
  @survey_question = Question.create(params[:question], survey_id: @survey.id)
  @survey_response_1 = Response.create(content: params[:response][:content1], question_id: @survey_question.id )
  @survey_response_2 = Response.create(content: params[:response][:content2], question_id: @survey_question.id )
  @survey_response_3 = Response.create(content: params[:response][:content3], question_id: @survey_question.id )
  @survey_response_4 = Response.create(content: params[:response][:content4], question_id: @survey_question.id )
  redirect '/profile'
end

get '/complete_survey/:id' do
  @survey = Survey.find(params[:id])
    erb :complete_survey
end

# post '/complete_survey/:id' do
  
#   redirect '/profile'
# end
