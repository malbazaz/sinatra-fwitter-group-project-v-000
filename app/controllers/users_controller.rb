class UsersController < ApplicationController

  get "/signup" do
      erb :'users/create_user'
    end

    post "/signup" do
      binding.pry
      if !!session[:user_id]
        redirect '/tweets'
      end
      if params[:username] == ""
        redirect "/signup"
      end
      if params[:email] == ""
        redirect "/signup"
      end
      if params[:password] == ""
        redirect "/signup"
      end
      user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      if user
  	     redirect "/tweets"
      else
        redirect "/login"
  	  end
    end

    get '/account' do
      @user = User.find(session[:user_id])
      erb :'users/show'
    end


    get "/login" do
      erb :'users/login'
    end

    post "/login" do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/tweets"
      else
        redirect "/login"
      end
    end

    get "/logout" do
      session.clear
      redirect "/"
    end

    helpers do
      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find(session[:user_id])
      end
    end

end
