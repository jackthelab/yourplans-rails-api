class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create_user, :create_business]

    def create_user
        @user = User.find_by(email: user_login_params[:email])
        if @user && @user.authenticate(user_login_params[:password])
            #.authenticate from BCrypt
            token = encode_token({ user_id: @user.id })
            render json: { user: @user.to_json(:except => [:email, :password_digest, :created_at, :updated_at]), jwt: token }, status: :accepted
        else
            render json: {message: "Invalid email or password"}, status: :unauthorized
        end   
    end

    def create_business
        @business = Business.find_by(email: business_login_params[:email])
        if @business && @business.authenticate(business_login_params[:password])
            #.authenticate from BCrypt
            token = encode_token({ business_id: @business.id })
            render json: { business: @business.to_json(:except => [:password_digest, :created_at, :updated_at]), jwt: token }, status: :accepted
        else
            render json: {message: "Invalid email or password"}, status: :unauthorized
        end 
    end

    private

    def business_login_params
        params.require(:business).permit(:email, :password)
    end

    def user_login_params
        params.require(:user).permit(:email, :password)
    end

end
