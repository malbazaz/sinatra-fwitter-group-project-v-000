class TweetsController < ApplicationController

get '/tweets' do
  if !!session[:user_id]
    @user = User.find_by_id(session[:user_id])
  end
#binding.pry
erb :'tweets/tweets'

end

end
