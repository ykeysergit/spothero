require 'app/domain/rate/day'

# Composite pattern
module App
  module Domain
    module Rate
      class Rates
        attr_reader :sun, :mon, :tue, :wed, :thu, :fri, :sat
        
        def initialize
          @sun=Day.new(:sun)
          @mon=Day.new(:mon)
          @tue=Day.new(:tues)
          @wed=Day.new(:wed)
          @thu=Day.new(:thurs)
          @fri=Day.new(:fri)
          @sat=Day.new(:sat)  
        end
        
        # start_time: start DateTime
        # end_time: end DateTime
        def calculate_price(start_time,end_time)
          #puts "[Rates][calculate_price] start_time: #{start_time}, end_time: #{end_time}"
          
          num_days = (end_time-start_time).to_i
          
          days_range=(start_time..(start_time+num_days))
          #puts "[Rates][calculate_price] Days range: #{days_range.to_a.length}"
          
          price=days_range.to_a.reduce(0) do |total_price, datetime_val|
            #puts "[Rates][calculate_price] datetime val: #{datetime_val}"
            total_price + calculate_price_for_datetime(start_time,end_time,datetime_val)
          end
          
          #puts "[Rates][calculate_price] total price: #{price}"
          #puts
          #puts
          price
        end
        
        def to_h
          hash_display={
            rates:{}
          }
          
          hash_display[:rates][sun.label]=sun.to_h
          hash_display[:rates][mon.label]=mon.to_h
          hash_display[:rates][tue.label]=tue.to_h
          hash_display[:rates][wed.label]=wed.to_h
          hash_display[:rates][thu.label]=thu.to_h
          hash_display[:rates][fri.label]=fri.to_h
          hash_display[:rates][sat.label]=sat.to_h
          hash_display
        end
        
        def to_s
          JSON.generate(to_h)
        end
        
        #
        # protected
        protected
        def calculate_price_for_datetime(start_time,end_time,datetime_val)
          #puts "[Rates][calculate_price_for_datetime] datetime_val: #{datetime_val}"
          
          if datetime_val.sunday?
            sun.calculate_price(start_time,end_time)
          elsif datetime_val.monday?
            mon.calculate_price(start_time,end_time)
          elsif datetime_val.tuesday?
            tue.calculate_price(start_time,end_time)
          elsif datetime_val.wednesday?
            wed.calculate_price(start_time,end_time)
          elsif datetime_val.thursday?
            thu.calculate_price(start_time,end_time)
          elsif datetime_val.friday?
            fri.calculate_price(start_time,end_time)
          elsif datetime_val.saturday?
            sat.calculate_price(start_time,end_time)  
          else
            0
          end
        end
      end
    end
  end
end