class HomesController < ApplicationController
  def index
    # @temperature  |= params[:num]

    @users = User.all
    

  end
end
