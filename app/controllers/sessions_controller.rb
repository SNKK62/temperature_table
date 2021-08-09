class SessionsController < ApplicationController
  def new
  end

  def create
    group = Group.find_by(name: params[:session][:name])
    if group && group.authenticate(params[:session][:password])
      log_in group
      params[:session][:remember_me] == '1' ? remember(group) : forget(group)
      redirect_back_or group
    else
      flash.now[:danger] = "名前 または パスワードが正しくありません"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? 
    redirect_to root_url
  end


end
