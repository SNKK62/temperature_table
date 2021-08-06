class TemperaturesController < ApplicationController
  def new
  end
  
  def create
  end

  def edit
    
  end


  

  def update
    @users = User.all 
    @user = User.find_by(id: params[:id])
    @temp = @user.temperatures.first
    @temp.update(temperature_params)
       
  end
  
  private

  def temperature_params
    params.permit(:num)
  end

  

  

  
end
