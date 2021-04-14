class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, ENV['AUTH_SECRET_KEY'])
    end

    def auth_header
        #looking for 'Authorization': 'Bearer <token>' in headers: {...}
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            ## ['Bearer', '<token>']
            # byebug
            begin
                JWT.decode(token, ENV['AUTH_SECRET_KEY'], true, algorithm: 'HS256')[0]
                # byebug
                ##JWT.decode => [payload]
            rescue JWT::DecodeError
                nil
            end

        end

    end

    def current_user
        if decoded_token
            # byebug
            user_id = decoded_token['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def current_business
        if decoded_token
            business_id = decoded_token['business_id']
            @business = Business.find_by(id: business_id)
        end
    end

    def logged_in?
        !!current_user || !!current_business
    end

    def authorized
        render json: {message: "Please log in"}, status: :unauthorized unless logged_in?
    end
    
end
