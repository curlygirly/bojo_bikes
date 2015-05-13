require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

    attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def releases_bike
      @bikes.each.with_index do |bike, index|
        if bike.working?
          return @bikes.delete_at(index)
        end
      end
    fail "No bikes available"
  end

  def dock bike
    fail 'Der focking station is full' if full?
    @bikes << bike
  end




private

def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end


end