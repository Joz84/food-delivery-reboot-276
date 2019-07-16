require_relative "../models/meal.rb"
require_relative "base_repository"

class MealsRepository < BaseRepository

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_f
    Meal.new(row)
  end

  def csv_headers
    ['id', 'name', 'price']
  end
end
