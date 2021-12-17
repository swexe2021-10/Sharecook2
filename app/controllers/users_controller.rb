class UsersController < ApplicationController
    skip_before_action :logged_in_user, only: [:index, :create, :new]
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
            flash[:notice] = '新規登録しました'
            redirect_to root_path
        else
            render 'login'
        end 
    end 
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to controller: :users, action: :index
    end
end
