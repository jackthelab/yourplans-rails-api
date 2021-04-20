class Api::V1::BidsController < ApplicationController

    def create
        bid = Bid.create!(bid_params)

        if bid.valid?
            render json: bid, except: [:created_at, :updated_at]
        else
            render json: { error: "This bid couldn't be created."}
        end

    end

    def update
        bid = Bid.find(params[:id])
        if bid.update(bid_params)
            render json: bid, except: [:created_at]
        else
            render json: { message: "Couldn't update this bid" }
        end
    end

    def delete
        bid = Bid.find(params[:id])
        bid.destroy
    end

    private

    def bid_params
        params.require(:bid).permit(:user_id, :name, :city, :state, :budget, :num_in_party, :notes, :open_status, :date)
    end
    
end
