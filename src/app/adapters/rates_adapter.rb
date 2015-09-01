require 'app/domain/rate/rates'
require 'app/domain/rate/hour_range'

class RatesAdapter  
  def initialize(rates_hash={})
    @rates_hash=rates_hash
    @rates_composite=Rates.new
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
    hour_range=HourRange.new(times_range_str[0].to_i,times_range_str[1].to_i,price)
    
    if Rates::SUN.label==day_str.to_sym
      Rates::SUN.hour_ranges << hour_range
    elsif Rates::MON.label==day_str.to_sym
      Rates::MON.hour_ranges << hour_range
    elsif Rates::TUE.label==day_str.to_sym
      Rates::TUE.hour_ranges << hour_range
    elsif Rates::WED.label==day_str.to_sym
      Rates::WED.hour_ranges << hour_range
    elsif Rates::THU.label==day_str.to_sym
      Rates::THU.hour_ranges << hour_range
    elsif Rates::FRI.label==day_str.to_sym
      Rates::FRI.hour_ranges << hour_range
    elsif Rates::SAT.label==day_str.to_sym
      Rates::SAT.hour_ranges << hour_range
    end
  end
end