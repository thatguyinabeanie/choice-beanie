module Helpers
  module JWT
    class TokenHandler
      def jwt_payload!(request)
        return nil if request.headers['Authorization'].blank?

        decode!(request.headers['Authorization'].split.last)
      end

      private

      def decode!(token)
        devise_jwt_secret_key = Rails.application.credentials.devise_jwt_secret_key || ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
        JWT.decode(token, devise_jwt_secret_key).first
      rescue JWT::DecodeError => e
        Rails.logger.error "JWT::DecodeError: #{e.message}"
        raise
      end
    end
  end
end
