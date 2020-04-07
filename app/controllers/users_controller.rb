class UsersController < ApplicationController


    get "/signup" do 
        erb:'users/signup'
    end

    post '/users' do 
        @user = User.create(params)
        redirect to "/users/#{@user.id}"
    end 

    get '/users/:id' do 
        binding.pry
        @user.find_by_id(params[:id])
        erb :show
    end 
end 