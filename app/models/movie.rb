class Movie < Sequel::Model(:movies);
  one_to_many :reservations

  def validate
    super
    errors.add(:name, "can't be empty") if name.empty?
  end

  dataset_module do
    def range_date(date)
      where(Sequel.lit("start_date < '#{date}' AND end_date > '#{date}'"))
    end
  end
end
