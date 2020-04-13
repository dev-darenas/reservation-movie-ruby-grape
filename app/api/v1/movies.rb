module API
  module V1
    class Movies < Grape::API
      resource :movies do
        desc 'Return list of movies.'
        get do
          p " enter to return list movies "
          { some: "some" }
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
          MoviesTransactions::Create.call(params: params)
        end
      end
    end
  end
end
