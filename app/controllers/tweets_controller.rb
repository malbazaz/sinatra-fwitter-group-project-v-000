class TweetsController < ApplicationController

get '/tweets' do
#  binding.pry

  if !!session[:user_id]
    @user = User.find_by_id(session[:user_id])
    erb :'tweets/tweets'
  else
    redirect '/login'
  end
#binding.pry

end

get '/tweets/new' do
erb :'tweets/create_tweet'
end

post '/tweets' do
  binding.pry
#  @tweet = nil
# redirect to "/tweets/#{@tweet.id}"
end

get '/tweets/:id' do

end

get '/tweets/:id/edit' do

end

post '/tweets/:id' do

end

end
