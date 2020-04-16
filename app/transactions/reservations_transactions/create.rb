module ReservationsTransactions
  class Create < BaseTransaction
    step :check_customer
    step :create_reservation

    def check_customer(input)
      @customer = Customer.first(identification: input[:customer][:identification])
      @customer = Customer.create(input[:customer]) if @customer.nil?

      Success(input)
    end

    def create_reservation(input)
      @movie = Movie.first(id: input[:movie_id])
      Failure(error: 'Movie doesn`t exist') if @movie.nil?
      input.delete("customer")
      input[:customer_id] = @customer.id
      @reservation = Reservation.create(input)
      Success(@reservation)
    end
  end
end