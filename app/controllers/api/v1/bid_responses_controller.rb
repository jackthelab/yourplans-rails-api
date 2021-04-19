class Api::V1::BidResponsesController < ApplicationController

    def create
        bid_response = BidResponse.create!(bid_response_params)

        if bid_response.valid?
            render json: bid_response, except: [:created_at, :updated_at]
        else
            render json: { error: "This bid response couldn't be created."}
        end

    end

    private

    def bid_response_params
        params.require(:bid_response).permit(:business_id, :bid_id, :price, :category, :details)
    end

end
