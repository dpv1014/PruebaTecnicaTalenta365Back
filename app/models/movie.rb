class Movie < ApplicationRecord
  scope :by_day, ->(day) { where("days ->> " + day + " = ?", day) }
end
