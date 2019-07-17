require "csv"
require_relative "../models/employee.rb"
require_relative "base_repository"

class EmployeesRepository < BaseRepository
  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  undef_method :add

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def csv_headers
    ['id', 'username', 'password', 'role']
  end



end
