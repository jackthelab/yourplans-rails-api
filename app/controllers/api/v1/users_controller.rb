class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        # render json: @user, except: [:email, :password_digest, :created_at, :updated_at], status: :accepted
        render json: @user.to_json(:include => {
            :bids => {except: [:user_id, :created_at, :updated_at] }
        }, except: [:email, :password_digest, :created_at, :updated_at])
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user.to_json(except: [:email, :password_digest, :created_at, :updated_at]), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
