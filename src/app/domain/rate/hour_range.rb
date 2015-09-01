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
          #puts "[HourRange][calculate_price] start time: #{start_time}, end time: #{end_time}"
          #puts "[HourRange][calculate_price] Start time hour: #{start_time.hour}"
          #puts "[HourRange][calculate_price] start hour: #{@range.first}"
          #puts "[HourRange][calculate_price] End time hour: #{end_time.hour}"
          #puts "[HourRange][calculate_price] end hour: #{@range.last}"
          #puts "[HourRange][calculate_price] price: #{@price}"
          
          if start_time.hour >= @range.first && end_time.hour <= @range.last
            #puts "[HourRange][calculate_price] num hours: #{(end_time.hour-start_time.hour)}. Price: #{@price}"
            price=(end_time.hour-start_time.hour)*@price
            #puts "[HourRange][calculate_price] price: #{price}"
            price
          else
            #puts "[HourRange][calculate_price] Price not found"
            0
          end
        end
      end
    end
  end
end