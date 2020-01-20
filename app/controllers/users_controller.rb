class UsersController < ApplicationController

  def index
    redirect_to new_user_registration_path
  end

  def show
    @user = current_user
    @schedules = Schedule.where(user_id: @user.id)
    render 'show'
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password)
  end

end
