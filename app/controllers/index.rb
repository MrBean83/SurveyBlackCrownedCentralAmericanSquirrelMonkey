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

