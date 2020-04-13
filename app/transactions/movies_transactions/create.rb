module MoviesTransactions
  class Create < BaseTransaction
    tee :params
    step :create_movie

    def params(input)
      @params = input.fetch(:params)
    end

    def create_movie(input)
      p " ** started process to create movie ** "

      if true
        Failure(error: 'some error!')
      else
        Success()
      end
    end
  end
end

