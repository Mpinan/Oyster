require 'Oystercard'
describe Oystercard do
  #Checks that the methods are working
  it {expect(Oystercard.new).to respond_to(:balance)}
  it {expect(Oystercard.new).to respond_to(:in_journey?)}
  context '#balance' do
    #The amount of money you start with, which is 0
    it {expect(subject.balance).to eq(0)}
    end

    context '.top up' do
      #Checks that one does not exceed 
      #the amount of money you put in the card.
      #Raises an error when you put more than 100
      it { expect(subject).to respond_to(:top_up).with(1).arguments }
      it 'raise an error if top_up exceed the maximum balance' do
        expect{subject.top_up(101)}.to raise_error ('You cannot put more money')
      end
    end
    context '.deduct' do
      #Substract an argument amount
      it 'deduct money from balance' do
        expect(subject).to respond_to(:deduct).with(1).argument
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
    #it 'substract amount from balance' {
    #subject = Oystercard.new
    #subject.top_up(50)
    #expect(subject.touch_out).to eq(balance - 5)
  end
end

