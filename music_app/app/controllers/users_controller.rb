class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.create(user_params)

    if user.save
      redirect_to user_url(user)
    else
      redirect_to new_user_url
    end
  end

  def show
    if current_user
      render :show
    else
      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require('users').permit(:email, :password)
  end
end
