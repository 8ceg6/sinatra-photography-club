class UsersController < ApplicationController


    get "/signup" do 
        erb:'users/signup'
    end

    get '/login' do 
        erb :"users/login"
    end 

    post '/login' do 
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect to "/users/#{user.id}"
            else 
                redirect to '/'
            end 
    end 

    post '/signup' do 
        user = User.create(params)
        if user.valid?
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
        else
            redirect to "/signup"
        end 
    end 

    get '/users/:id' do 
        if User.find_by_id(params[:id])
            @user = User.find_by_id(params[:id])
            erb :'users/show'
        else  
            redirect to '/'
        end
    end 
end 