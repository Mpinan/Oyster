require 'station'
describe Station do
  it 'has a name' do
    station = Station.new("west ham", 2)
    expect(station.name).to eq "west ham"
  end

  it 'has a zone' do
    station = Station.new("west ham", 2)
    expect(station.zone).to eq 2
  end
end