get '/profile' do
session[:user_id] = 1
erb :user_profile
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey_results
end
