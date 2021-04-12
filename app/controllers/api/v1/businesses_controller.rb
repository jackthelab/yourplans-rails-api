class Api::V1::BusinessesController < ApplicationController
    def index
        businesses = Business.all
        # render json: businesses
        render json: { message: "This is the businesses index" }
    end
end
