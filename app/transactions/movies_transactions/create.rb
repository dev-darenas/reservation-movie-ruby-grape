module MoviesTransactions
  class Create < BaseTransaction
    step :create_movie

    def create_movie(input)
      movie = Movie.create(input)
      Success(movie)
    end
  end
end
