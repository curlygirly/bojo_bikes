require_relative 'bike'

class DockingStation
  def releases_bike
    Bike.new
  end
end