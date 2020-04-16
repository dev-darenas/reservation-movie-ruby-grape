class Reservation < Sequel::Model(:reservations);
  many_to_one :movie

end
