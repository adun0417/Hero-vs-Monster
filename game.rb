class Monster
  attr_accessor :name, :hp, :ap



  def initialize(name,hp,ap)
    @name = name
    @hp = hp
    @ap = ap
    @alive = true

    puts "遇到怪獸 #{@name}"
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

monster = Monster.new("Dr.boom",110,30)
holy_knight = HolyKnight.new("聖光大螺絲",110,30)

while holy_knight.is_alive? && monster.is_alive?

  holy_knight.attack(monster)
  if !monster.is_alive?
    break
  end

  monster.attack(holy_knight)
end
