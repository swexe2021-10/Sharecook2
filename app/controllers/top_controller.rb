class TopController < ApplicationController
  def main
    render 'main'
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.password) == params[:password]
      #TODO: ログイン成功したことをユーザに知らせる
      session[:login_uid] = user.uid
      redirect_to controller: :cooks, action: :index
    else
      #TODO: エラーメッセージ
      render 'login'
    end
  end

  def logout
    #TODO: ログアウトに成功したことをユーザに知らせる
    session.delete(:login_uid)
    redirect_to root_path
  end
end
