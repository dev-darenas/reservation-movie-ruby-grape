class Reservation < Sequel::Model(:reservations);
  many_to_one :movie

  def validate
    super
    errors.add(:count_reservation, "cannot be greater than 10") if Reservation.where(movie_id: movie_id, reservation_date: reservation_date).count >= 10
  end

  dataset_module do
    def range_date(start_date, end_date)
      where(reservation_date: (start_date...end_date))
    end
  end
end
