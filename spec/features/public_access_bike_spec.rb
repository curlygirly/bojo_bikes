 feature 'Member of the public accesses bike' do
  scenario 'Docking station releases working bike' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike = docking_station.releases_bike
    expect(bike).to be_working
    end
  end