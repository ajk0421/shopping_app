# 登場人物
# - ユーザー
# - 商品
# - カート

# 出来ること
# 1 商品を追加出来る
#   - どの商品か？
#   - 個数が何個か？
# 2 カートの情報が見れる
#   - どの商品が入ってるか
#   - 合計金額

require 'pry'

class User
end

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Cart
  INITIAL_PRICE = 0

  def initialize
    @orders = []
    @total_price = INITIAL_PRICE
  end

  def add_product(product, count)
    order = { product: product, count: count }
    @total_price += product.price * count
    @orders << order
  end

  def disp_cart
    @orders.each do |order|
      puts "#{order[:product].name}(#{order[:product].price}円) × #{order[:count]}個"
    end

    puts "合計金額#{@total_price}円"
  end
end

product_1 = Product.new('チェリー本', 1000)
product_2 = Product.new('ワンピース', 1000)
cart = Cart.new

cart.add_product(product_1, 2)
cart.add_product(product_2, 10)
cart.disp_cart
