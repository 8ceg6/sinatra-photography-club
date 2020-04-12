class UsersController < ApplicationController


    get "/signup" do 
        if  Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/login"
        else
        erb :'users/signup'
        end 
    end

    get '/login' do 
        if  Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        end
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

    get '/users' do 
        if Helpers.is_logged_in?(session)
            @users = User.all
            erb :'users/index'
        else
            redirect to '/'
        end 
    end 

    get '/users/:id' do 
        if Helpers.is_logged_in?(session) && User.find_by_id(params[:id])
            @user = User.find_by_id(params[:id])
            @cameras = @user.cameras
            @cam = Camera.find_by_id(params[:id])
            
        else  
            redirect to '/'
        end 
        erb :'users/show'
    end 

    get '/users/:id/edit' do 
        @user = User.find_by_id(params[:id])

        erb :"users/edit"
    end 

    patch '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        if  @user  == Helpers.current_user(session)
            @user.update(params[:user])
            redirect to "/users/#{@user.id}/edit"
        else
            redirect to "/users"
        end
      end

    get '/logout' do 
        if  Helpers.is_logged_in?(session)
            session.clear
            redirect to '/'
        else 
            redirect to '/'
        end
    end 
    delete '/users/:id/delete' do 
        user = User.find_by_id(params[:id])
        if user == Helpers.current_user(session)
            user.delete
            session.clear
            redirect to '/'
        else 
            redirect to '/users'
        end
      end
end 