class Api::V1::ExperiencesController < ApplicationController

    def create
        experience = Experience.create!(experience_params)

        if experience.valid?
            render json: experience, except: [:create_at, :updated_at]
        else
            render json: { message: "Could not create this experience"}
        end
    end

    private

    def experience_params
        params.require(:experience).permit(:bid_id, :bid_response_id, :complete)
    end
end
