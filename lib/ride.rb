require './lib/visitor'

class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
              
  def initialize(data)
    @name = data[:name]
    @min_height = data[:min_height]
    @admission_fee = data[:admission_fee]
    @excitement = data[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def board_rider(visitor)
    if visitor.preferences.include?@excitement
      if visitor.tall_enough?(@min_height)
        if visitor.spending_money >= @admission_fee
          visitor.spending_money -= @admission_fee
          @total_revenue += @admission_fee
          @rider_log[visitor.name] = visitor
        end
      end
    end
  end
end