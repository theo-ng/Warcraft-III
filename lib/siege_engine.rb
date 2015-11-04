class SiegeEngine < Unit

  def initialize
    @health_points = 400
    @attack_power = 50
  end

  def attack!(enemy)
    raise InvalidAttackError if enemy.health_points < 1 || self.health_points < 1
    case enemy.class.name
    when "SiegeEngine" then super(enemy)
    when "Peasant" || "Footman" then raise InvalidAttackError
    when "Barracks" then enemy.damage(self.attack_power * 4)
    end
  end

end