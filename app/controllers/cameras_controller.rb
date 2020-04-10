class CamerasController < ApplicationController
    get '/cameras' do 
            @cameras = Camera.all  
            @users = User.all
            erb :'cameras/index'
        end

    get '/cameras/new' do 
        erb :'cameras/new'
    end 

    
    post '/cameras' do 
        @camera = Camera.create(params)
        user = Helpers.current_user(session)
        # binding.pry
        @camera.user = user
        @camera.save
        
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
        @camera = Camera.find_by_id(params[:id])
        @user = @camera.user
        
        if !Helpers.is_logged_in?(session) || !@camera || @camera.user != Helpers.current_user(session)
        redirect to '/cameras' 
        else
            erb :'/cameras/edit'
        end
      end

      patch '/cameras/:id/edit' do
        @camera = Camera.find_by_id(params[:id])
        @camera.update(params[:camera])
        redirect to "/cameras/#{@camera.id}/edit"
      end

      delete '/cameras/:id/delete' do 
        user = User.find_by_id(params[:id])
        camera = Camera.find_by_id(params[:id])
        camera.delete
        redirect to "/users/#{camera.user.id}"
      end
end 