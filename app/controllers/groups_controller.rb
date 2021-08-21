class GroupsController < ApplicationController
  before_action :logged_in_group, only: [:edit,:update,:destroy,:show]
  before_action :correct_group, only:[:edit, :update,:show,:destroy, :update_temps]
  

  def index
    if logged_in? 
       
       redirect_to group_path(current_group) 
    else
       redirect_to new_group_path
    end
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @user = User.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    
    if @group.save
      log_in @group
      flash[:success] = "登録に成功しました"
      redirect_to @group
    else
      render 'new'
    end
  end

  def update_temps
    @group = Group.first
    if @group.id == 1 && current_group.id == 1
      Temperature.add_temps
    end
    redirect_to group_path(@group)
  end

  def edit
    @group = Group.find(params[:id])
    @users = @group.users 
  end

  def update
    @group = Group.find(params[:id])
    @users = @group.users
    if @group.update(group_params)
      flash[:success] = "更新しました"
      redirect_to @group
    else
      flash.now[:danger] = "更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_url
  end

  # def sort
  #   @group = Group.find(params[:id])
  #   user = @group.users[params[:from].to_i]
  #   user.insert_at(params[:to].to_i + 1)
  #   @users = @group.users
  #   head :ok
  # end

  private
   def group_params
    params.require(:group).permit(:name, :password, :password_confirmation)
   end

   def logged_in_group
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

  def correct_group
    @group = Group.find(params[:id])
    unless current_group?(@group)
      flash[:danger] = "アカウントが正しくありません"
      redirect_to(login_path)
    end
  end

  
end
