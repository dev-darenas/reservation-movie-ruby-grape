module API
  module V1
    class Reservations < Grape::API
      resource :reservations do
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
              { error: error }
            end
          end
        end
      end
    end
  end
end
