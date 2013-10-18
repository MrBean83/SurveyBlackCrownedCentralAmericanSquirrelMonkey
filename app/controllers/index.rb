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
  @survey_question = Question.new(params[:question])
  @survey_response_1 = Response.new(params[:content1])
  @survey_response_2 = Response.new(params[:content2])
  @survey_response_3 = Response.new(params[:content3])
  @survey_response_4 = Response.new(params[:content4])
  redirect '/profile'
end
