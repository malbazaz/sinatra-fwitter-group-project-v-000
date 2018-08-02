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
  if !!session[:user_id]
    erb :'tweets/create_tweet'
  else
    redirect '/login'
  end
end

post '/tweets' do
 #binding.pry
  if params[:tweet][:content] == ""
    redirect to '/tweets/new'
  else
  @tweet = Tweet.create(content: params[:tweet][:content])
  @tweet.user_id = session[:user_id]
  @tweet.save
   redirect to "/tweets/#{@tweet.id}"
  end

end

get '/tweets/:id' do
@tweet = Tweet.find_by_id(params[:id])
erb :'tweets/show_tweet'
end

get '/tweets/:id/edit' do
  if !!session[:user_id]
    @tweet = Tweet.find_by_id(params[:id])
  erb :'tweets/edit_tweet'
  else
  redirect '/login'
  end
end

post '/tweets/:id' do
@tweet = Tweet.find_by_id(params[:id])
erb :'tweets/show_tweet'
end

end
