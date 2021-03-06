class Meal

  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_csv_row
    [@id, @name, @price]
  end

  def self.csv_headers
    ['id', 'name', 'price']
  end
end
