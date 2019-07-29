require 'Oystercard'
describe Oystercard do

  it {expect(Oystercard.new).to respond_to(:balance)}

  context '#balance' do
    
    it {expect(subject.balance).to eq(0)}
    end

    context '.top up' do

      it { expect(subject).to respond_to(:top_up).with(1).arguments }
      it 'raise an error if top_up exceed the maximum balance' do
        expect{subject.top_up(101)}.to raise_error ('You cannot put more money')
      end
    end
    context '.deduct' do
      it 'deduct money from balance' do
        expect(subject).to respond_to(:deduct).with(1).argument
      end
    end
  context '#in_journey?' do
    it 'returns true when card.touch in' do
        expect(subject.touch_in).to be(true)
    end
    it 'returns false when card.touch out' do
        expect(subject.touch_out).to be(false)
    end
  end

end

