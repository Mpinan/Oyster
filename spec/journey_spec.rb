require "Oystercard"
require "station"
require "journey"

describe Journey do
  let(:station) { double :station, zone: 1 }

  it "Knows if a journey it has started" do
    expect(subject).not_to be_complete
  end

  it "Has a penalty fare by default" do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "returns itself when exiting a journey" do
    expect(subject.finish(station)).to eq(subject)
  end

  context "given an entry station" do
    subject { described_class.new(entry_station: station) }
  end
  it "has an entry station" do
    expect(subject.entry_station(station)).to eq station
  end

  it "returns a penalty fare if no exit station give" do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  context "given an exit station" do
    let(:other_station) { double :other_station }

    before do
      subject.finish(other_station)
    end

    it "calculates a fare" do
      expect(subject.fare).to eq 1
		end
		it 'Knows if a journey is complete' do
			expect(subject).to be_complete
		end
	end
end
