class TemperaturesController < ApplicationController
  def new
  end
  
  def create
  end

  def edit
    
  end


  

  def update
    @group = current_group
    @users = @group.users
    @user = User.where(group_id: current_group.id, name: params[:name])
    @newuser = User.new
    if @user.empty?
      flash.now[:danger] = "そのメンバーは存在しません"

    else
      @user.each do |user|
        temp = user.temperatures.first
        if temp.update(temperature_params)
          
        else
          flash.now[:danger] = "体温を入力してください"
        end
      end
    end
       
  end
  
  private

  def temperature_params
    params.permit(:num)
  end

  

  

  
end
