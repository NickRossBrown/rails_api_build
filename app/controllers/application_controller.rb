class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  


  def members_only
    render json: {
      data: {
        message: "Welcome #{current_member.name}",
        user: current_member
      }
    }, status: 200
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

# This code will literally "rescue" our application from the specified ActiveRecord::RecordNotFound error by throwing an exception. Exceptions are a common programming concept. They indicate that something has gone wrong in your application. Remember that everything is an object in Ruby, so an exception is an instance of the Exception class (or a descendent of that class). By default, a Ruby application terminates when there’s an exception, but we can create exception handlers so the code within the handler is run (instead of the default action).

# The first argument in our json_response method takes the exception message and turns it into a JSON string. The second argument (:not_found) is the HTTP status code for the API request. You should have a general familiarity with HTTP status codes since you'll use them often.
#

end
