class AddDateToMovie < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :days
    add_column :movies, :day_start, :date
    add_column :movies, :day_end, :date
  end
end
