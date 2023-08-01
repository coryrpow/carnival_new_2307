require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before do
    @carnival = Carnival.new(14)
    @ride1 = Ride.new({ 
                    name: 'Carousel',
                    min_height: 24,
                    admission_fee: 1,
                    excitement: :gentle
                  })
    @ride2 = Ride.new({
                    name: 'Ferris Wheel',
                    min_height: 36,
                    admission_fee: 5,
                    excitement: :gentle
                  })
    @ride3 = Ride.new({
                    name: 'Roller Coaster',
                    min_height: 54,
                    admission_fee: 2,
                    excitement: :thrilling
                  })
    @visitor1 = Visitor.new("Bruce", 54, "$10")
    @visitor2 = Visitor.new("Tucker", 36, "$5")
    @visitor3 = Visitor.new("Penny", 64, "$15")
  end

  describe "#initialize" do
    it "exists and has readable attributes" do
      expect(@carnival).to be_a(Carnival)
      expect(@carnival.duration).to eq(14)
      expect(@carnival.rides).to eq([])
    end
  end

  describe "#add_ride" do
    it "it can add rides to the rides array" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe "#revenue_earned" do
    it "can show total revenue for all rides at the carnival" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)
      
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@carnival.revenue_earned).to eq(3)

    end
  end
end