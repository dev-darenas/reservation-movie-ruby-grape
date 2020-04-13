module API
  class Base < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    mount API::V1::Movies
  end
end
