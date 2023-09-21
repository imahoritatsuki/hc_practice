# ポケモンで学ぶ！クラスとオブジェクト指向
# 03:コンストラクタ
# https://zenn.dev/m_coder/books/oop-learning-with-pokemon/viewer/constructor

# インスタンス生成時の初期処理で、変数に任意の値を入れられるようにする

class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp

  def initialize(name:, type1:, type2: nil, hp:, mp:)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    @mp = mp
  end

  def attack
    puts "#{name}のこうげき!"
  end

end

charizard = Pokemon.new(name: "リザードン", type1: "ほのお", type2: "ひこう", hp: 100, mp: 10)
puts charizard.name
puts charizard.type1
charizard.attack
puts charizard.mp

pikachu = Pokemon.new(name: "ピカチュウ", type1: "でんき", hp: 80, mp: 30)
puts pikachu.name
puts pikachu.type1
pikachu.attack
puts pikachu.mp