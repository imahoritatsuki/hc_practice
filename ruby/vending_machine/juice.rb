class Juice
  attr_reader :product_name, :price
  def initialize(product_name:, price:)
    @product_name = product_name
    @price = price    
  end
end