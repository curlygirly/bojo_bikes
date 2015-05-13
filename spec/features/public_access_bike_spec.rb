feature 'public accesses bike from docking station' do

  let(:docking_station) { DockingStation.new }

  scenario 'bike is released from docking station' do
    docking_station.dock Bike.new
    bike = docking_station.releases_bike
    expect(bike).to be_working
  end

  scenario 'it does not release a bike when none are available' do
    expect { docking_station.releases_bike }.to raise_error 'No bikes available'
  end

  scenario 'docking station does not release broken bikes' do
    bike = Bike.new
    bike.report_broken
    docking_station.dock bike
    expect { docking_station.releases_bike }.to raise_error "No bikes available"
  end
end
