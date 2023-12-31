class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
    def index  
      @users = User.all
      render json: @users
    end
  
    def show
      render json: @user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: 200 
      else
        render json: { error: 'Unable to save' }, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user, status: 200
      else
        render json: { error: 'Unable to update' }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  
    private

    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:product_name, :price, :company, :color)
   end

end
  