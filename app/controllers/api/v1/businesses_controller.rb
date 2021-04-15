class Api::V1::BusinessesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: @business, except: [:password_digest, :created_at, :updated_at], status: :accepted
    end

    def create
        @business = Business.create(business_params)

        if @business.valid?
            @token = encode_token(business_id: @business.id)
            render json: { business: @business.to_json(except: [:password_digest, :created_at, :updated_at]), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create business' }, status: :not_acceptable
        end
    end

    private

    def business_params
        params.require(:business).permit(:name, :street_address, :city, :state, :phone, :email, :website, :twitter, :facebook, :instagram, :linkedin, :bio, :password)
    end

end
