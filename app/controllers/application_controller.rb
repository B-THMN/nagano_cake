class ApplicationController < ActionController::Base
  helper_method :current_customer

  def current_customer
    if session[:customer_id]
      @customer = Customer.find(session[:customer_id])
    else
      @customer = Customer.create
      session[:customer_id] = @customer.id
    end
  end
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end
