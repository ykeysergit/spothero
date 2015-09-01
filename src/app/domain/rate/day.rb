module App
  module Domain
    module Rate
      class Day
        attr_reader :label, :hour_ranges
        
        def calculate_price(start_time,end_time)
          @hour_ranges.reduce(0) do |total_price, hour_range|
            #puts "[Day][calculate_price] Start time: #{start_time}, end time: #{end_time}, hour_range check: #{hour_range}"
            delta=hour_range.calculate_price(start_time,end_time)
            #puts "[Day][calculate_price] delta: #{delta}"
            total_price + delta
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
    end
  end
end