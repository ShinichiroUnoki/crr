class UsersController < ApplicationController
  def show
    @user = current_user
    @schedules = Schedule.where(user_id: @user.id)
    render 'show'
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to("/")
    else
      render "/users/edit"
    end
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password)
  end

end
