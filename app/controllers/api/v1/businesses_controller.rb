class Api::V1::BusinessesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        # city_bids = @business.city_bids
        # render json: @business, except: [:password_digest, :created_at, :updated_at], status: :accepted
        render json: @business.to_json(:include => {
            :bid_responses => {except: [:business_id, :created_at, :updated_at] },
            :experiences => {except: [:bid_response_id, :created_at, :updated_at] }
        }, except: [:password_digest, :created_at, :updated_at])
    end

    def available_bids
        state_bids = @business.state_bids
        # city_bids = @business.city_bids

        if state_bids.count <= 0
            render json: { message: "There aren't currently any open bids in your region."}
        else
            render json: { bids: state_bids }
        end
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
