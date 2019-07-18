class Movie < ApplicationRecord
  has_many :reservations, dependent: :destroy

  scope :with_count_reservations_by_day, -> (from, to) {
    select("movies.*, CASE WHEN count(reservations.id) < " + ENV["MAX_RESERVATIONS_BY_MOVIE"] + " THEN TRUE ELSE FALSE END AS show_to_reserve")
    .joins("LEFT JOIN reservations ON reservations.movie_id = movies.id")
    .where("(movies.day_start BETWEEN '" + from + "' AND '" + to + "') OR (movies.day_end BETWEEN '" + from + "' AND '" + to + "')")
     .group('movies.id')
  }
  scope :with_count_reservations, -> {
    select("movies.*, CASE WHEN count(reservations.id) < " + ENV["MAX_RESERVATIONS_BY_MOVIE"] + " THEN TRUE ELSE FALSE END AS show_to_reserve")
    .joins("LEFT JOIN reservations ON reservations.movie_id = movies.id")
    .group('movies.id')
  }

end
