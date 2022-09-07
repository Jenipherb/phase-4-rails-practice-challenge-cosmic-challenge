class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def render_not_found_response(exeption)
        render json: { error: "#{exeption.model} not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exeption)
        render json: { errors: exeption.record.errors.full_messages }, status: :unprocessable_entity
    end

end
