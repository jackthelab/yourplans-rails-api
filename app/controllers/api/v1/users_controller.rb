class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: @user.to_json(:include => {
            :bids => {:include => {
                :bid_responses => {:include => {
                    :business => {except: [:password_digest, :created_at, :updated_at]}
                }, except: [:business_id, :created_at, :updated_at]}
            }, except: [:user_id, :created_at, :updated_at]},
            :experiences => {:include => {
                :bid => {except: [:id, :created_at, :updated_at] },
                :bid_response => {except: [:id, :created_at, :updated_at] }
            }, except: [:bid_id, :created_at, :updated_at] }
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
