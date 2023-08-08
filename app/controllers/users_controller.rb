class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.save
        render json: @user
    else 
        render json: { errors: 'user could not be created'}
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :phone_number,:google_calendar_access_token)
  end
end
