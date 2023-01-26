class SessionController < ApplicationController
	def login
        user = User.find_by :email=>params[:email]
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                user: user,               
                jwt: token}, status: :ok
        else
            render json: {status: "error", message: "We don't find such an user according to your information,please try again."}, status: :unprocessable_entity
        end
    end
                                
   
    def auto_login
        if session_user
            render json: session_user, status: :ok
        else
            render json: {errors: "No User Logged In."}, status: :unauthorized
        end     
    end
end
