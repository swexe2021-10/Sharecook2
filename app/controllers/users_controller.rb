class UsersController < ApplicationController
    def index
        @users = User.all
    end 
    def new
        @user = User.new
    end 
    def create
        uid = params[:user][:uid]
        password = BCrypt::Password.create( params[:user][:password])
        @user = User.new(uid: uid, password: password)
        if @user.save
            redirect_to root_path
        end 
    end 
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to controller: :users, action: :index
    end
end
