require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before do
    @carnival = Carnival.new(14)
  end

  describe "#initialize" do
    it "exists and has readable attributes" do
      expect(@carnival).to be_a(Carnival)
    end
  end

end