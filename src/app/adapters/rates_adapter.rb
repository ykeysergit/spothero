require 'app/domain/rate/rates'
require 'app/domain/rate/hour_range'

module App
  module Adapters
    class RatesAdapter  
      def initialize(rates_hash={})
        @rates_hash=rates_hash
        @rates_composite=App::Domain::Rate::Rates.new
      end
      
      def adapt
        @rates_hash['rates'].each do |rate_info|
          #puts "[RatesAdapter][adapt] adapt rate info: #{rate_info}"
          adapt_rate_info(rate_info)
        end
        
        @rates_composite
      end
      
      #
      # protected
      protected
      def adapt_rate_info(rate_info)
        rate_info['days'].split(',').each do |day_str|
          #puts "[RatesAdapter][adapt] adapt day: #{day_str}. Rate info: #{rate_info}"
          adapt_day(day_str,rate_info['times'],rate_info['price'])
        end
      end
      
      def adapt_day(day_str, times_str, price)
        times_range_str=times_str.split("-");
        hour_range=App::Domain::Rate::HourRange.new(times_range_str[0].to_i/100,times_range_str[1].to_i/100,price)
        
        if @rates_composite.sun.label==day_str.to_sym
          @rates_composite.sun.hour_ranges << hour_range
          
        elsif @rates_composite.mon.label==day_str.to_sym
          @rates_composite.mon.hour_ranges << hour_range
  
        elsif @rates_composite.tue.label==day_str.to_sym
          @rates_composite.tue.hour_ranges << hour_range
          
        elsif @rates_composite.wed.label==day_str.to_sym
          @rates_composite.wed.hour_ranges << hour_range
          
        elsif @rates_composite.thu.label==day_str.to_sym
          @rates_composite.thu.hour_ranges << hour_range
          
        elsif @rates_composite.fri.label==day_str.to_sym
          @rates_composite.fri.hour_ranges << hour_range
          
        elsif @rates_composite.sat.label==day_str.to_sym
          @rates_composite.sat.hour_ranges << hour_range
        end
      end
    end
  end
end