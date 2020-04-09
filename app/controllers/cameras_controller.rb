class CamerasController < ApplicationController


    get '/cameras/new' do 
        erb :'cameras/new'
    end 

    get '/cameras' do 
        @cameras = Camera.all  
        @users = User.all
        erb :'cameras/index'
    end
    post '/cameras' do 
        camera = Camera.create(params)
        user = Helpers.current_user(session)
        # binding.pry
        camera.user = user
        camera.save
        
        redirect to "/users/#{user.id}"
    end 

    get '/cameras/:id' do 
        @camera = Camera.find_by_id(params[:id])
        if !@camera
        redirect to '/cameras'
        else
        erb :'cameras/show'
        end
    end 
    
    get '/cameras/:id/edit' do
        # if !is_logged_in?
        # redirect to '/login' 
        # end
        @camera = Camera.find_by(params[:id])
        #  binding.pry
        # if @tweet.user_id == !current_user.id
            
        #     redirect to '/login'

        # else
          erb :'/cameras/edit'
        # end
      end

      patch '/cameras/:id' do
        @camera = Camera.find(params[:id])
        # if params[:brand].empty?
          redirect to "/cameras/#{@camera.id}/edit"
        # end
        @camera.update(:brand => params[:brand])
        @camera.save
    
        redirect to "/cameras/#{@camera.id}"
      end
end 