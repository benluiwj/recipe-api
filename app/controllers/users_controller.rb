class UsersController < ApplicationController
	skip_before_action :require_login, only: [:create]
	def index
		@users = User.all
		render json: @users, status: :ok
	end

	def show
		render json: @user, status: :ok
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user, status: :created
		
		else
			render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def update
		unless @user.update(user_params)
			render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		@user.destroy
	end

	private 

	def user_params
		params.permit(:user_name, :email, :password, :name)
	end

	def find_user
		@user = User.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'User not found' }, status: :not_found
	end
end
