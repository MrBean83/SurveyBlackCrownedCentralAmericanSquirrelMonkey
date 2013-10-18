get '/surveyresults/:survey_id' do
  @user = User.find(session[:user_id])
  @survey = Survey.find(params[:survey_id])
  erb :survey_results
end

get '/surveystaken/:survey_id' do
  @user = User.find(session[:user_id])
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @user_responses = @user.responses.where(survey_id: @survey.id)
  erb :survey_response
end
