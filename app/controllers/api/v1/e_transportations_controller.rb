module Api
  module V1
    class ETransportationsController < ApplicationController
      def create
        @transportation = ETransportation.new(
          transportation_type: transportation_params[:transportation_type] || "EScooter",
          sensor_type: transportation_params[:sensor_type],
          owner_id: transportation_params[:owner_id]
        )
        @transportation.valid?

        if @transportation.save
          @scooter = EScooter.create!(
            e_transportation_id: @transportation.id,
            sensor_type: transportation_params[:sensor_type]
          )
          render json: @transportation, status: :created
        else
          render json: { errors: @transportation.errors }, status: :unprocessable_entity
        end
      end

      def index
        render json: ETransportation.all
      end

      def show
        @transportation = ETransportation.find(params[:id])
        render json: @transportation
      rescue ActiveRecord::RecordNotFound
        render json: { error: "E-Transportation not found" }, status: :not_found
      end

      def outside_zone_stats
        render json: ETransportation.outside_zone_count
      end

      private

      def transportation_params
        params.require(:e_transportation).permit(:transportation_type, :sensor_type, :owner_id, :in_zone, :lost_sensor)
      end
    end
  end
end
