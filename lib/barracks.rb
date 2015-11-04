class Barracks

  attr_accessor :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 100
  end

  def can_train_footman?
    self.gold >= 135 && self.food >= 2
  end

  def train_footman
    if can_train_footman?
      self.gold -= 135
      self.food -= 2
      ready_for_action = Footman.new
    end
  end

  def can_train_peasant?
    self.gold >= 90 && self.food >= 5
  end

  def train_peasant
    if can_train_peasant?
      self.gold -= 90
      self.food -= 5
      ready_to_work = Peasant.new
    end
  end

  def damage(amount)
    self.health_points -= (amount / 2).ceil
  end

  def build_siege_engine
    if can_build_siege_engine?
      self.gold -= 200
      self.lumber -= 60
      self.food -= 3
      siege = SiegeEngine.new
    end
  end

  def can_build_siege_engine?
    self.gold >= 200 && self.lumber >= 60 && self.food >= 3
  end
end
