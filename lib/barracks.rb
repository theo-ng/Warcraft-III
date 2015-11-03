class Barracks

  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    self.gold > 135 && self.food > 2 ? true : false
  end

  def train_footman
    if can_train_footman?
      self.gold -= 135
      self.food -= 2
      ready_for_action = Footman.new
    end
  end

  def can_train_peasant?
    self.gold > 90 && self.food > 5 ? true : false
  end

  def train_peasant
    if can_train_peasant?
      self.gold -= 90
      self.food -= 5
      ready_to_work = Peasant.new
    end
  end
end
