class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :camper_error_invalid
    def index
        campers = Camper.all
        render json: campers 
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper

    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper

    end

    private
    def not_found
        render json: {errors: "Camper not found."}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

    def camper_error_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity

    end

end
