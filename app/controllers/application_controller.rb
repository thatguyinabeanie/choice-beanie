class ApplicationController < ActionController::Base
end

# class ApplicationController < ActionController::API
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     keys = %i[first_name last_name]
#     # For sign up
#     devise_parameter_sanitizer.permit(:sign_up, keys:)
#     # For account update
#     devise_parameter_sanitizer.permit(:account_update, keys)
#   end
# end
