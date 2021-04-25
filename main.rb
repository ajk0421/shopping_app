# 登場人物
# - ユーザー
#   - 名前
#   - 所持金
# - 商品
# - カート

# 出来ること
# 1 ユーザー情報を定義
#   - カートを紐づける
# 2 商品を追加出来る
#   - どの商品か？
#   - 個数が何個か？
# 3 カートの情報が見れる
#   - どの商品が入ってるか
#   - 合計金額
# 4 - 買い物の可否

require 'pry'

class User
  attr_accessor :name, :money, :cart

  def initialize(name, money)
    @name = name
    @money = money
    @cart = Cart.new
  end

  def check_out?
    @money >= @cart.total_price
  end

  def shopping_result
    puts "所持金#{@money}円"
    if check_out?
      puts 'お買い上げありがとうございます'
    else
      puts '所持金が足りません'
    end
  end
end

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Cart
  INITIAL_PRICE = 0.freeze

  attr_reader :total_price
  attr_writer

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

user = User.new('あじー', 12000)

# レシーバー . メソッド
user.cart.add_product(product_1, 2)
user.cart.add_product(product_2, 10)

user.cart.disp_cart
user.shopping_result
