module Api
  module V1
    class SessionsController < ::Api::ApplicationController
      skip_before_action :current_user
      def create
        result = Sessions::Create.run(params)
        if result.valid?
          cookies.encrypted[:auth_token] = { value: result.result.auth_token, expires: 1.day.from_now }
          render json: result.result, serializer: Sessions::SessionSerializer
        else
          render json: { message: result.errors.to_a }, status: :bad_request
        end
      end

      def login
        result = Sessions::Login.run(params)
        if result.valid?
          render json: { message: ' Email with code, was succesfully sended', attributes: result.result }, status: :ok
        else
          render json: { message: result.errors }, status: :bad_request
        end
      end

      def destroy
        cookies.delete(:auth_token)
        head :no_content
      end
    end
  end
end
