class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render json: @user

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { errors: @planet.errors }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head 204
  end

end
