require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def add(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end


  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << @elements.first.class.csv_headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
    end
    @next_id = @elements.length + 1
  end
end
