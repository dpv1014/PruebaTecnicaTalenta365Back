class Reservation < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  scope :include_user_by_day, -> (from, to) {
    select("reservations.*, movies.name AS movie_name, users.*")
    .joins(:user, :movie)
    .where("(movies.day_start BETWEEN '" + from + "' AND '" + to + "') OR (movies.day_end BETWEEN '" + from + "' AND '" + to + "')")
  }

  scope :include_user, -> {
    select("reservations.*, movies.name AS movie_name, users.*")
    .joins(:user, :movie)
    .all
  }

  validate :validate_limit_reservations_movie

  private
    def validate_limit_reservations_movie
      limit = ENV["MAX_RESERVATIONS_BY_MOVIE"].to_i
      if !(movie.reservations.count + 1 <= limit)
        errors.add("LIMIT_RESERVATIONS_EXCEEDED")
      end
    end
end
