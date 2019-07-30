require 'Oystercard'
describe Oystercard do
  #Checks that the methods are working
  it {expect(Oystercard.new).to respond_to(:balance)}
  it {expect(Oystercard.new).to respond_to(:in_journey?)}
  #The amount of money you start with, which is 0
  it {expect(subject.balance).to eq(0)}
  #What goes on in top up method
  context '.top up' do
      #Checks that one does not exceed 
      #the amount of money you put in the card.
      #Raises an error when you put more than 100
      it { expect(subject).to respond_to(:top_up).with(1).arguments }
      it 'can top up a balance' do 
        expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      end
      #raise an error if top_up exceed the maximum balance'
      it {expect{subject.top_up(101)}.to raise_error ('You cannot put more money')}
 
  end
  context '.deduct' do
    #Substract an argument amount
    it 'deduct money from balance' do
      expect(subject).to respond_to(:deduct).with(1).argument
    end
    it 'deduct amount from balance when touch out' do
      subject.top_up(5)
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.balance }.by (-Oystercard::MIN_JOURNEY_COST)
    end
  end
  context '#in_journey?' do
    #Subject creates a new instances class everytime you write It
    it {
      subject = Oystercard.new
      subject.top_up(5)

      expect(subject.touch_in).to be(true)
    }
    it {expect(subject.touch_out).to be(false)}
    it 'raise an error if not enough balance' do
        expect{subject.touch_in}.to raise_error ('Insuficient balance')
    end
  end
end

