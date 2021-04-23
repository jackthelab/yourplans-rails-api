class Api::V1::BidResponsesController < ApplicationController

    def index
        bid = Bid.find_by(id: params[:bid_id])
        responses = bid.bid_responses
        render json: responses.to_json(:include => {
            :business => {except: [:password_digest, :created_at, :updated_at]}
        }, except: [:business_id, :created_at, :updated_at])
    end

    def show
        bid_response = BidResponse.find(params[:id])
        business = Business.find(bid_response.business_id)

        render json: { bid_response: bid_response.to_json(except: [:created_at, :updated_at]), business: business.to_json(except: [:id, :password_digest, :created_at, :updated_at]) }
    end

    def create
        bid_response = BidResponse.create!(bid_response_params)

        if bid_response.valid?
            render json: bid_response.to_json(:include => {
                :bid => {only: [:id, :name, :open_status]}
            }, except: [:business_id, :created_at, :updated_at])
        else
            render json: { error: "This bid response couldn't be created."}
        end

    end

    private

    def bid_response_params
        params.require(:bid_response).permit(:business_id, :bid_id, :price, :category, :details)
    end

end
