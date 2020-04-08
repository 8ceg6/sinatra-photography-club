class CamerasController < ApplicationController


    get '/cameras/new' do 


        erb :'cameras/new'
    end 

    post '/cameras' do 
        camera = Camera.create(params)
        user = Helpers.current_user(session)
        # binding.pry
        camera.user = user
        camera.save
        
        redirect to "/users/#{user.id}"
    end 
end 