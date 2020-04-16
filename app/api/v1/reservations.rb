module API
  module V1
    class Reservations < Grape::API
      resource :reservations do
        desc 'Return list of reservations.'
        params do
          requires :start_date, type: Date
          requires :end_date, type: Date
        end
        get do
          Reservation.range_date(
            params[:start_date],
            params[:end_date]
          ).collect { |m| m.values }
        end

        desc 'create a reservation'
        params do
          requires :reservation_date, type: Date
          requires :movie_id, type: String
          requires :customer, type: Hash do
            requires :email, type: String
            requires :name, type: String
            requires :identification, type: String
          end
        end
        post do
          ReservationsTransactions::Create.call(params) do |result|
            result.success do |reservation|
              reservation.values
            end

            result.failure do |error|
              error!(error, 400)
            end
          end
        end
      end
    end
  end
end
