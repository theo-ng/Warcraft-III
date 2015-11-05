class Barracks

  attr_accessor :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 100
  end

  def can_train_footman?
    gold >= Footman::COST[:gold] && food >= Footman::COST[:food]
  end

  def train_footman
    if can_train_footman?
      self.gold -= Footman::COST[:gold]
      self.food -= Footman::COST[:food]
      Footman.new
    end
  end

  def can_train_peasant?
    gold >= Peasant::COST[:gold] && food >= Peasant::COST[:food]
  end

  def train_peasant
    if can_train_peasant?
      self.gold -= Peasant::COST[:gold]
      self.food -= Peasant::COST[:food]
      Peasant.new
    end
  end

  def damage(amount)
    self.health_points -= (amount / 2).ceil
  end

  def build_siege_engine
    if can_build_siege_engine?
      self.gold -= SiegeEngine::COST[:gold]
      self.lumber -= SiegeEngine::COST[:lumber]
      self.food -= SiegeEngine::COST[:food]
      SiegeEngine.new
    end
  end

  def can_build_siege_engine?
    gold >= SiegeEngine::COST[:gold] && lumber >= SiegeEngine::COST[:lumber] && food >= SiegeEngine::COST[:food ]
  end
end
