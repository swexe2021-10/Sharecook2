class TopController < ApplicationController
  skip_before_action :logged_in_user 
  def main
    render 'main'
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.password) == params[:password]
      session[:login_uid] = user.uid
      flash[:notice] = "ログインが成功しました"
      redirect_to controller: :cooks, action: :index
    else
      #TODO: エラーメッセージ
      render 'login'
    end
    
  end

  def logout
    flash[:notice] = 'ログアウトしました'
    session.delete(:login_uid)
    redirect_to root_path
  end
end
