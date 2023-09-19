require_relative './suica'
require_relative './vending_machine'
require_relative './juice'


#**********

# ステップ1　Suica
suica = Suica.new 

# 預かり金(デポジット)として500円がデフォルトでチャージされているものとする
p suica.balance #=> 500

# Suicaには100円以上の任意の金額をチャージできる
suica.charge(100) 
p suica.balance #=> 600

# 100円未満をチャージしようとした場合は例外を発生させる
# suica.charge(50) #=> 100円以上を入金してください

# Suicaは現在のチャージ残高を取得できる
p suica.balance #=> 600


#**********

# ステップ2　ジュースの管理
machine = VendingMachine.new

# 自動販売機はジュースを１種類格納できる
# 初期状態で、ペプシ(150円)を5本格納している。
# 自動販売機は在庫を取得できる
p machine.vending_storage #=> [{:product_name=>"ペプシ", :stock=>5, :price=>150}, {:product_name=>"モンスター", :stock=>5, :price=>230}, {:product_name=>"いろはす", :stock=>5, :price=>120}]

# ジュースは名前と値段の情報をもつ
# p pepsi = Juice.new(product_name: "ペプシ", price: 150)

# ステップ3　購入処理

# 自動販売機は現在の売上金額を取得できる
p machine.sales_amount #=> 0

# 自動販売機はペプシが購入できるかどうかを取得できる。
p machine.available_for_purchase_a_product("ペプシ",suica) #=> [{:product_name=>"ペプシ", :stock=>5, :price=>150}]

# ジュース値段以上のチャージ残高がある条件下で購入操作を行うと以下の動作をする
machine.purchase("ペプシ", suica)

# 自動販売機はジュースの在庫を減らす
p machine.vending_storage #=> [{:product_name=>"ペプシ", :stock=>4, :price=>150}, {:product_name=>"モンスター", :stock=>5, :price=>230}, {:product_name=>"いろはす", :stock=>5, :price=>120}]

# 売り上げ金額を増やす
p machine.sales_amount #=> 150

# Suicaのチャージ残高を減らす
p suica.balance #=> 450

# チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる


# ステップ4　機能拡張
# ジュースを3種類管理できるようにする。
# 初期在庫にモンスター(230円)5本を追加する。
# 初期在庫にいろはす(120円)5本を追加する。
p machine.vending_storage #=> [{:product_name=>"ペプシ", :stock=>4, :price=>150}, {:product_name=>"モンスター", :stock=>5, :price=>230}, {:product_name=>"いろはす", :stock=>5, :price=>120}]

# 自動販売機は購入可能なドリンクのリストを取得できる
p machine.available_for_purchase_list(suica) #=> [{:product_name=>"ペプシ", :stock=>4, :price=>150}, {:product_name=>"モンスター", :stock=>5, :price=>230}, {:product_name=>"いろはす", :stock=>5, :price=>120}]

# 自動販売機に在庫を補充できるようにする
monster = Juice.new(product_name: "モンスター", price: 230)
p machine.add_stock(monster) #=> [{:product_name=>"ペプシ", :stock=>4, :price=>150}, {:product_name=>"モンスター", :stock=>6, :price=>230}, {:product_name=>"いろはす", :stock=>5, :price=>120}]

pepsi = Juice.new(product_name: "ペプシ", price: 150)
p machine.add_stock(pepsi) #=> [{:product_name=>"ペプシ", :stock=>5, :price=>150}, {:product_name=>"モンスター", :stock=>6, :price=>230}, {:product_name=>"いろはす", :stock=>5, :price=>120}]


ilohas = Juice.new(product_name: "いろはす", price: 120)
p machine.add_stock(ilohas) #=> [{:product_name=>"ペプシ", :stock=>5, :price=>150}, {:product_name=>"モンスター", :stock=>6, :price=>230}, {:product_name=>"いろはす", :stock=>6, :price=>120}]

# ステップ3と同様の方法でモンスターといろはすを購入できる 
machine.purchase("モンスター", suica)
p machine.vending_storage #=> [{:product_name=>"ペプシ", :stock=>5, :price=>150}, {:product_name=>"モンスター", :stock=>5, :price=>230}, {:product_name=>"いろはす", :stock=>6, :price=>120}]

machine.purchase("いろはす", suica)
p machine.vending_storage #=> [{:product_name=>"ペプシ", :stock=>5, :price=>150}, {:product_name=>"モンスター", :stock=>5, :price=>230}, {:product_name=>"いろはす", :stock=>5, :price=>120}]
