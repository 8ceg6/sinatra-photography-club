# require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      @user = User.find(session[:user_id])
      end 
  
    def is_logged_in?
      !!session[:user_id]
    end 
  end
end
