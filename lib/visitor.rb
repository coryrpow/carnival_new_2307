class Visitor
  attr_accessor :name,
                :height,
                :spending_money,
                :preferences
                
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @preferences = []
    @spending_money = spending_money.delete("$").to_i
  end

  def add_preference(preference)

    @preferences << preference
    @preferences
  end

  def tall_enough?(minimum_height)
    if @height >= minimum_height
      true
    else
      false
    end
  end
end