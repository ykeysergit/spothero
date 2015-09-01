class Day
  attr_reader :label, :hour_ranges
  
  def calculate_price(start_time,end_time)
    @hour_ranges.reduce do |total_price, hour_range|
      total_price + hour_range.calculate_price(start_time,end_time)
    end
  end
  
  def to_h
    hash_display={times: []}
    
    hour_ranges.each do |hour_range|
      hash_display[:times]<<hour_range.to_h
    end
    
    hash_display
  end
  
  #
  # protected
  protected
  def initialize(label)
    @label=label
    @hour_ranges=[]
  end
end