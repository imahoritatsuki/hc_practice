class VendingMachine
  attr_reader :vending_storage, :sales_amount

  def initialize
    @vending_storage = [
      {
        product_name: "ペプシ", 
        stock: 5, 
        price: 150 
      },
      {
        product_name: "モンスター",
        stock: 5, 
        price: 230
      },
      {
        product_name: "いろはす",
        stock: 5,
        price: 120
      }
    ]
    @sales_amount = 0
  end

  def purchase(want_product, suica)
    selected_product = find_product(want_product)
    
    raise "該当の商品が見つかりません" unless selected_product
    raise "売り切れです" unless stock_available?(selected_product)
    
    buy_product(selected_product, suica)
    
  end

  def available_for_purchase_a_product(product_name, suica)
    available_for_purchase_a_product = @vending_storage.select do |item| 
      item[:product_name] == product_name && item[:stock] >= 1 && suica.balance >= item[:price]
    end
    if available_for_purchase_a_product 
      "#{product_name}は購入可能です"
    else
      "#{product_name}は購入できません"
    end
  end

  def available_for_purchase_list(suica)
    @vending_storage.select do |item| 
      item[:stock] >= 1 && suica.balance >= item[:price]
    end
  end
  
  def add_stock(juice, quantity=1)
    charge_item = @vending_storage.find do |item|
      item[:product_name] == juice.product_name
    end
    if charge_item
      charge_item[:stock] += quantity
    else
      @vending_storage << {product_name: juice.product_name, stock: quantity, price: juice.price}
    end
    @vending_storage
  end

  private

  def find_product(want_product)
    @vending_storage.find { |item| item[:product_name] == want_product }
  end

  def stock_available?(product)
    product[:stock] > 0
  end

  def buy_product(product, suica)
    suica.deduct(product[:price])
    product[:stock] -= 1
    @sales_amount += product[:price]
  end

end