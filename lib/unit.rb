class Unit

  attr_reader :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def damage(amount)
    @health_points -= amount
  end

  def attack!(enemy)
    enemy.damage(self.attack_power)
  end

end