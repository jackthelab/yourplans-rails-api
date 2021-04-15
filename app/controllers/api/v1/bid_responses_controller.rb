class Api::V1::BidResponsesController < ApplicationController

    # def create
    #     bid = Bid.create!(bid_params)

    #     if bid.valid?
    #         render json: bid, except: [:created_at, :updated_at]
    #     else
    #         render json: { error: "This bid couldn't be created."}
    #     end

    # end

    # private

    # def bid_params
    #     params.require(:bid).permit(:user_id, :name, :city, :state, :budget, :num_in_party, :notes, :open_status, :date)
    # end

end
