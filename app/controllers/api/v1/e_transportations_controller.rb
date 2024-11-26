module Api
  module V1
    class ETransportationsController < ApplicationController
      def create
        transportation = if params[:type] == "e-Scooter"
          EScooter.new(transportation_params)
        else
          ETransportation.new(transportation_params)
        end

        if transportation.save
          render json: transportation, status: :created
        else
          render json: { errors: transportation.errors }, status: :unprocessable_entity
        end
      end

      def index
        render json: ETransportation.all
      end

      def outside_zone_stats
        render json: ETransportation.outside_zone_count
      end

      private

      def transportation_params
        params.require(:e_transportation).permit(:vehicle_type, :sensor_type, :owner_id, :in_zone, :lost_sensor)
      end
    end
  end
end
