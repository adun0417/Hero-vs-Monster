class Monster
  attr_accessor :name, :hp, :ap  # 在class Monster裡也必須要設定attr_accessor :hp, :name
                                 # 讓外部的這一個attack方法可以抓到monster.hp這個屬性。 #line:95


  def initialize(name,hp,ap) #傳入資料為 name,hp,ap
    @name = name       # 用 name 設定 attributes @name
    @hp = hp           # 設定一個名為 hp（生命值）的 attribute
    @ap = ap           # 設定一個名為 ap（生命值）的 attribute
    @alive = true      # 怪獸剛被創造，所以預設為 true，表示怪獸創造時一定是活著的

    puts "遇到怪獸 #{@name}"
    puts "生命力(HP) #{@hp}"
    puts "攻擊力(AP) #{@ap}"
    puts ""
  end

  def is_alive?
    return @alive
  end

  def attack(enemy)
    damage = rand(@ap/2..@ap) # 傷害會隨機取攻擊力的一半（AP／2）至 AP 的數字
    enemy.hp = enemy.hp - damage #新的生命力是生命力減去傷害

    puts "#{@name}發動攻擊！"
    puts "#{enemy.name} 受到 #{damage} 點傷害！"
    puts "#{enemy.name} 剩下 #{enemy.hp} 點HP。"
    puts ""

    if enemy.hp < 1
      enemy.die
    end

  end

  def die
    @alive = false
    puts "-----#{@name} 被打倒了!!-----"
    puts ""
  end
end

class Hero

  attr_accessor :name, :hp, :ap

  def initialize(name,hp,ap)
    @name = name
    @hp = hp
    @ap = ap
    @alive = true

    puts "召喚英雄:#{@name}"
    puts "生命力(HP) #{@hp}"
    puts "攻擊力(AP) #{@ap}"
    puts ""
  end

  def is_alive?
    return @alive
  end


  def attack(enemy)
    damage = rand(@ap/2..@ap)
    enemy.hp = enemy.hp - damage

    puts "#{@name} 發動攻擊！"
    puts "#{enemy.name} 受到 #{damage} 點傷害！"
    puts "#{enemy.name} 剩下 #{enemy.hp} 點HP。"
    puts ""

    if enemy.hp < 1
      enemy.die
    end

  end


  def die
    @alive = false
    puts "-----#{@name} 被打倒了!!-----"
    puts ""
  end

end

class HolyKnight < Hero
  def attack(enemy)

    damage = rand(@ap..@ap*2)
    enemy.hp = enemy.hp- damage

    puts "#{@name} 發射聖光！"
    puts "#{enemy.name} 受到 #{damage} 點傷害！"
    puts "#{enemy.name} 剩下 #{enemy.hp} 點HP。"
    puts ""

    if enemy.hp < 1
      enemy.die
    end
  end
end



#----------------------執行過程----------------------#

monster = Monster.new("Dr.boom",110,30) # 用 Monster class 創造一個 name 為 Dr.boom 的物件，放入 monster 這個變數裡
holy_knight = Hero.new("聖光大螺絲",110,30) #對應到需要小寫的物件名稱，習慣用底線分開英文大字
#hero = Hero.new("炸雞勇者",200,30)

while holy_knight.is_alive? && monster.is_alive?

  holy_knight.attack(monster)
  if !monster.is_alive?
    break
  end

  monster.attack(holy_knight)
end
