require "csv"
require_relative "../models/customer.rb"
require_relative "base_repository"

class CustomersRepository < BaseRepository
  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def csv_headers
    ['id', 'name', 'address']
  end

end
