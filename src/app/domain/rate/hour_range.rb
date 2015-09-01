require 'json'

module App
  module Domain
    module Rate
      class HourRange
        attr_reader :range, :price
        
        def initialize(start_hour,end_hour, price)
          @range=(start_hour..end_hour)
          @price=price
        end
        
        def to_h
          {start_hour: @range.first, end_hour: @range.last, price: price}
        end
        
        def to_s
          JSON.generate(to_h)
        end
        
        def calculate_price(start_time, end_time)
          if start_time.hour >= @range.hour && end_time.hour <= @range.hour
            (end_time-start_time)*@price
          else
            0
          end
        end
      end
    end
  end
end