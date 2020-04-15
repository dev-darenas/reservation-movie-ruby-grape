module API
  module V1
    class Movies < Grape::API
      resource :movies do
        desc 'Return list of movies.'
        params do
          requires :date, type: Date
        end
        get do
          Movie.range_date(params[:date]).collect { |m| m.values }
        end

        desc 'Create a Movie.'
        params do
          requires :name, type: String
          optional :description, type: String
          optional :image_url, type: String
          requires :start_date, type: Date
          requires :end_date, type: Date
        end
        post do
          MoviesTransactions::Create.call(params) do |result|
            result.success do |movie|
              movie.values
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
