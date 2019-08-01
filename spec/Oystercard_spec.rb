require 'Oystercard'
describe Oystercard do
  let(:entry_station){ double(:station) }
  let(:exit_station) { double(:station) }

  it 'has a balance of zero' do
      expect(subject.balance).to eq 0
  end

  describe '#top up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
        expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if the maximum balance is exceeded' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up maximum_balance
        expect{ subject.top_up 1 }.to raise_error 'Cannot top up: Max balance exceeded'
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect{ subject.touch_in(entry_station) }.to raise_error 'Cannot touch in: Already in journey'
    end

    it 'wont be able to touch in, insufficient balance' do
      expect{ subject.touch_in(entry_station) }.to raise_error 'Cannot touch in: Insufficient balance'
    end
  end

  describe '#touch_out' do
    context 'while not on a journey' do
      it 'raises an error' do
        expect{ subject.touch_out(exit_station) }.to raise_error "Cannot touch out: didn't touch in"
      end
    end

    it 'charges minimun fare when touch out' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FAIR )
    end
  end

  describe '#journeys' do
    it 'returns all the past journeys' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to eq [{:entry_station => entry_station, :exit_station => exit_station}]
    end

    it 'is initially empty' do
      expect(subject.journeys).to be_empty
    end
  end
end

