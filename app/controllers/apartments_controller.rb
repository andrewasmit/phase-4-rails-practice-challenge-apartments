class ApartmentsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def show
        apartment = Apartment.find(params[:id])
        render json: apartment, status: :ok
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update!(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def render_unprocessable_entity_response e
        render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
