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
    raise InvalidAttackError if enemy.health_points < 1 || self.health_points < 1
    enemy.damage(self.attack_power)
  end

  def dead?
    @health_points <= 0 ? true : false
  end
end