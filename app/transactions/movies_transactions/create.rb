module MoviesTransactions
  class Create < BaseTransaction
    step :create_movie

    def create_movie(input)
      movie = Movie.new(input)

      if movie.valid?
        movie.save
        Success(movie)
      else
        Failure(error: movie.errors)
      end
    end
  end
end
