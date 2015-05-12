require 'docking_station'

describe DockingStation do
  it{ is_expected.to respond_to :releases_bike }

  it 'releases working bikes' do
    bike = subject.releases_bike
    expect(bike).to be_working
  end

end