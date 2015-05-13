require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :releases_bike}
  it {is_expected.to respond_to(:dock).with(1).argument }

  describe 'dock' do
  it 'releases working bike' do
    bike = double :bike, broken?: false
    subject.dock bike
    expect(subject.releases_bike).to be bike
    end

  it 'cant release a bike when none are available' do
    expect{subject.releases_bike}.to raise_error 'No bikes available'
  end

  it 'cannot accept a bike if the docking station is full' do
    subject.capacity.times { subject.dock double :bike }
    expect{subject.dock double :bike }.to raise_error 'Der focking station is full'
    end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'will not release a broken bike' do
    bike = double :bike, broken?: true
    subject.dock bike
    expect { subject.releases_bike }.to raise_error "No bikes available"
  end
end
end