class UsersController < ApplicationController
  before_action :logged_in_group, only: [:edit, :update, :show, :destroy]
  before_action :correct_ownner, only: [:edit, :update, :show,:destroy]

  def show
    @user = User.find(params[:id])
    @temps = @user.temperatures
    
  end

  def new
    @user = User.new
  end




  def create
    @group = current_group
    @users = @group.users 
    
    @newuser = User.new
    
    if !@users.find_by(user_params)
      @user = @group.users.new(user_params) 
      if  @user.save
        @user.temperatures.create(num: "未記入")
      else
        @users = @users.take(@users.count)
        flash.now[:danger] = "名前を入力してください"
      end
    else
      flash.now[:danger] = "そのメンバーはすでに存在します"
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "メンバー名を変更できました"
      redirect_to group_path(current_group)
    end
  end

  def destroy(bool: true,user: nil)
    @users = current_group.users
    if !user
      User.find(params[:id]).destroy
    else
      user.destroy
    end
    
    if bool
      flash[:success] = "メンバーを削除しました"
      redirect_to group_path(current_group)
    else
      flash.now[:success] = "メンバーを削除しました"
    

    end
  end

  def del
    user = User.find(params[:id])
    destroy(bool: false,user: user)
    @users = current_group.users
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def logged_in_group
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

  def correct_ownner
    unless logged_in? && current_group.id ==  User.find(params[:id]).group_id
      redirect_to new_group_path
    end
  end
end
