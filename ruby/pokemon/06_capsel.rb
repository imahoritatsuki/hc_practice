# ポケモンで学ぶ！クラスとオブジェクト指向
# 06:カプセル化
# https://zenn.dev/m_coder/books/oop-learning-with-pokemon/viewer/encapsulation

# モジュールに名前を変更するメソッドを用意しincludeすることで、Pokemonクラス派生ではないクラスでも流用が可能
# @nameは読み取り専用のため、インスタンス名.name = で変更できない。

module ChangeName
  def change_name(name)
    @name = name
  end
end


class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp

  include ChangeName

  def initialize(name:, type1:, type2: nil, hp:, mp:)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    @mp = mp
  end

  def self.new(**args)
    if self == Pokemon
      raise "ポケモンクラスは抽象クラスのため、インスタンス化できません"
    end
    super
  end

  def introduction_attack
    puts "#{@name}の攻撃"
  end

  def attack
    raise '子クラスで攻撃方法を定義してください#{@name}の〇〇'
  end

end

class Pikachu < Pokemon

  def introduction_attack
    super
  end

  def attack
    puts "#{@name}の10万ボルト"
  end
end

class Zenigame < Pokemon
  def attack
    puts "#{@name}のみずてっぽう"
  end
end


pikachu = Pikachu.new(name: "ピカチュウ", type1: "でんき", hp: 80, mp: 30)
puts pikachu.name
pikachu.change_name("A") 
puts pikachu.name #=> A
puts pikachu.type1
pikachu.introduction_attack
pikachu.attack
puts pikachu.mp

puts "ææææ"

zenigame = Zenigame.new(name: "ゼニガメ", type1: "みず", hp: 90, mp: 25)
puts zenigame.name
zenigame.change_name("B")
puts zenigame.name #=> B
puts zenigame.type1
zenigame.introduction_attack
puts zenigame.mp