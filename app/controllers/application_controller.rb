# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  include Banken
  protect_from_forgery

  rescue_from Banken::NotAuthorizedError, with: :employee_not_authorized

  private

  def employee_not_authorized(exception)
    loyalty_name = exception.loyalty.class.to_s.underscore

    flash[:error] = t "#{loyalty_name}.#{exception.query}", scope: "banken", default: :default
    redirect_to(request.referrer || root_path)
  end
end
