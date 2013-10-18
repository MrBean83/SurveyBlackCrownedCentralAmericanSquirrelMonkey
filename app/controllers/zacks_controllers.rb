get '/profile' do
session[:user_id] = 1
erb :user_profile
end
