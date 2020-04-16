class Customer < Sequel::Model(:customers);
  one_to_many :reservations

  def validate
    super
    errors.add(:email, "can't be empty") if email.empty?
    errors.add(:identification, "can't be empty") if identification.empty?
  end
end
