class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.create(user_params)

    if user.save
      render json: 'Yay'
    else
      render json: 'No'
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
