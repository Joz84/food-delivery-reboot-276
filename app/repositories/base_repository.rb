require "csv"

class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      @elements << build_element(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_path, 'wb', csv_options) do |csv|
      csv << csv_headers
      @elements.each do |element|
        csv << element.csv_array
      end
    end
  end
end
