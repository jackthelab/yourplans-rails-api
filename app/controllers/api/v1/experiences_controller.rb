class Api::V1::ExperiencesController < ApplicationController

    def create
        experience = Experience.create!(experience_params)

        if experience.valid?
            render json: experience.to_json(:include => {
                :bid => {except: [:created_at, :updated_at]},
                :bid_response => {:include => {
                    :business => {only: [:name, :street_address, :city, :state]}
                }, except: [:created_at, :updated_at]}
            }, except: [:bid_response_id, :created_at, :updated_at])
        else
            render json: { message: "Could not create this experience"}
        end
    end

    private

    def experience_params
        params.require(:experience).permit(:bid_id, :bid_response_id, :complete)
    end
end
