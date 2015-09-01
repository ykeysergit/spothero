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
          adapt_rate_info(rate_info)
        end
        
        @rates_composite
      end
      
      #
      # protected
      protected
      def adapt_rate_info(rate_info)
        rate_info['days'].split(',').each do |day_str|
          adapt_day(day_str,rate_info['times'],rate_info['price'])
        end
      end
      
      def adapt_day(day_str, times_str, price)
        times_range_str=times_str.split("-");
        hour_range=App::Domain::Rate::HourRange.new(times_range_str[0].to_i,times_range_str[1].to_i,price)
        
        if App::Domain::Rate::Rates::SUN.label==day_str.to_sym
          App::Domain::Rate::Rates::SUN.hour_ranges << hour_range
        elsif App::Domain::Rate::Rates::MON.label==day_str.to_sym
          App::Domain::Rate::Rates::MON.hour_ranges << hour_range
        elsif App::Domain::Rate::Rates::TUE.label==day_str.to_sym
          App::Domain::Rate::Rates::TUE.hour_ranges << hour_range
        elsif App::Domain::Rate::Rates::WED.label==day_str.to_sym
          App::Domain::Rate::Rates::WED.hour_ranges << hour_range
        elsif App::Domain::Rate::Rates::THU.label==day_str.to_sym
          App::Domain::Rate::Rates::THU.hour_ranges << hour_range
        elsif App::Domain::Rate::Rates::FRI.label==day_str.to_sym
          App::Domain::Rate::Rates::FRI.hour_ranges << hour_range
        elsif App::Domain::Rate::Rates::SAT.label==day_str.to_sym
          App::Domain::Rate::Rates::SAT.hour_ranges << hour_range
        end
      end
    end
end
end