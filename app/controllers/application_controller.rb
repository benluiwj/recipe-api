class ApplicationController < ActionController::API	
	def authenticate_user
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
			@decoded = JsonWebToken.decode(header)
			@current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => exception
			render json: {errors: exception.message}, status: :unauthorized
		rescue JWT::DecodeError => exception
			render json: {errors: exception.message}, status: :unauthorized
		end
	end
end
