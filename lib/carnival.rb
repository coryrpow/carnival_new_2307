require './lib/visitor'
require './lib/ride'

class Carnival
  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
    @total_revenue = 0
  end

  def add_ride(ride)
    @rides << ride.name
    
  end
end