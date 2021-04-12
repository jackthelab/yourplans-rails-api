class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        # render json: users
        render json: { message: "This is the users index" }
    end
end
