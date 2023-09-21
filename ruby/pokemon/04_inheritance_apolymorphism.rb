# ポケモンで学ぶ！クラスとオブジェクト指向
# 04:継承とポリモーフィズム
# https://zenn.dev/m_coder/books/oop-learning-with-pokemon/viewer/inherit

# それぞれの子クラスで、親クラスのとある同じメソッドを使いつつ、それぞれの子クラスでは違う振る舞いをさせる

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
    puts "#{@name}のこうげき!"
  end

end

class Pikachu < Pokemon

  def attack
    super
    puts "#{@name}の10万ボルト"
  end
end

class Zenigame < Pokemon
  def attack
    super
    puts "#{@name}のみずてっぽう"
  end
end



pikachu = Pikachu.new(name: "ピカチュウ", type1: "でんき", hp: 80, mp: 30)
puts pikachu.name
puts pikachu.type1
pikachu.attack #=> ピカチュウのこうげき! ピカチュウの10万ボルト
puts pikachu.mp

puts "ææææ"

zenigame = Zenigame.new(name: "ゼニガメ", type1: "みず", hp: 90, mp: 25)
puts zenigame.name
puts zenigame.type1
zenigame.attack #=> ゼニガメのこうげき! ゼニガメのみずてっぽう
puts zenigame.mp

