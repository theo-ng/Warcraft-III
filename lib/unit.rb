class Unit

  attr_reader :health_points, :attack_power

  COST = {gold: 0, food: 0, lumber: 0}

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def damage(amount)
    @health_points -= amount
  end

  def attack!(enemy)
    raise InvalidAttackError if enemy.health_points < 1 || health_points < 1
    enemy.damage(attack_power)
  end

  def dead?
    health_points <= 0
  end
end