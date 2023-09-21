# ポケモンで学ぶ！クラスとオブジェクト指向
# 02:クラス
# https://zenn.dev/m_coder/books/oop-learning-with-pokemon/viewer/what-is-class

# クラスを用いて変数を管理できるようにする

class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp

  def initialize
    @name = "リザードン"
    @type1 = "ほのお"
    @type2 = "ひこう"
    @hp = 100
    @mp = 10
  end

  def attack
    puts "#{name}のこうげき!"
  end

end

poke = Pokemon.new
puts poke.name
puts poke.type1
poke.attack
puts poke.mp