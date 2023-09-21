# ポケモンで学ぶ！クラスとオブジェクト指向
# 05:クラスの抽象化
# https://zenn.dev/m_coder/books/oop-learning-with-pokemon/viewer/abstract-class

# Rubyでクラスの抽象化を模倣。
  #「Pokemonクラスのインスタンス作成」を禁止する
  # attackメソッドの具体的な定義を子クラスに委ね、「子クラスで定義していないattackメソッドの呼び出し」を禁止する

  class Pokemon
    attr_reader :name, :type1, :type2, :hp, :mp
  
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
  #Zenigameクラスでattackメソッドの定義をしていない場合とする
    # def attack
    #   puts "#{@name}のみずてっぽう"
    # end
  end
  
  pikachu = Pikachu.new(name: "ピカチュウ", type1: "でんき", hp: 80, mp: 30)
  puts pikachu.name
  puts pikachu.type1
  pikachu.introduction_attack
  pikachu.attack
  puts pikachu.mp
  
  puts "ææææ"
  
  zenigame = Zenigame.new(name: "ゼニガメ", type1: "みず", hp: 90, mp: 25)
  puts zenigame.name
  puts zenigame.type1
  zenigame.introduction_attack
  # zenigame.attack #=> errorが出る「`attack': 子クラスで攻撃方法を定義してください#{@name}の〇〇」
  puts zenigame.mp
  
  # pokemon = Pokemon.new(name: "ジグザグマ", type1: "ノーマル", hp: 70, mp: 30) #=> errorが出る「`new': ポケモンクラスは抽象クラスのため、インスタンス化できません」
  
  