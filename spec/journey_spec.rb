require 'Oystercard'
require 'station'
require 'journey'

describe Journey do
	let(:station) { double :station, zone: 1 }
  context '#Complete' do
	  it 'Knows if a journey it has started' do
	  	expect(subject).not_to be_started
		end
		it 'Know if a journey is finished' do
			expect(subject).to be_finish
		end

		it 'Has a penalty fare by default' do
			expect(subject.fare).to eq Journey::PENALTY_FARE
		end
  end
end
