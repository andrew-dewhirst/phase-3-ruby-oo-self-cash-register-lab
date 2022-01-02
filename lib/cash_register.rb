require 'pry'

class CashRegister

  attr_accessor :total, :discount, :cart, :transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @transaction = []
  end

  def total
    @total
  end
  def add_item(item, price, quantity = 1)
    self.total = (price * quantity) + self.total
    cost_per_item = price * quantity
    quantity.times{self.cart.push(item)}
    self.transaction.push(cost_per_item)
  end
  def apply_discount
    discount_percentage = self.discount/100.to_f
    self.total = self.total - (self.total * discount_percentage)
    if discount_percentage == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end
  def items
    self.cart
  end
  def void_last_transaction
    self.transaction.pop
    self.total = self.transaction.sum
  end
end

new = CashRegister.new(0)
new.add_item('mac', 1000)
puts new.apply_discount
puts new.total



