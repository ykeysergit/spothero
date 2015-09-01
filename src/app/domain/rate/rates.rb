require 'app/domain/rate/day'

# Composite pattern
class Rates
  SUN=Day.new(:sun)
  MON=Day.new(:mon)
  TUE=Day.new(:tues)
  WED=Day.new(:wed)
  THU=Day.new(:thurs)
  FRI=Day.new(:fri)
  SAT=Day.new(:sat)
  
  def calculate_price(start_time,end_time)
    (start_time..end_time).reduce do |total_price, datetime_val|
      total_price + calculate_price_for_datetime(datetime_val)
    end
  end
  
  def to_h
    hash_display={
      rates:{}
    }
    
    hash_display[:rates][SUN.label]=SUN.to_h
    hash_display[:rates][MON.label]=MON.to_h
    hash_display[:rates][TUE.label]=TUE.to_h
    hash_display[:rates][WED.label]=WED.to_h
    hash_display[:rates][THU.label]=THU.to_h
    hash_display[:rates][FRI.label]=FRI.to_h
    hash_display[:rates][SAT.label]=SAT.to_h
    hash_display
  end
  
  def to_s
    JSON.generate(to_h)
  end
  
  #
  # protected
  protected
  def calculate_price_for_datetime(start_time,end_time,datetime_val)
    if datetime_val.sunday?
      SUN.calculate_price(start_time,end_time)
    elsif datetime_val.monday?
      MON.calculate_price(start_time,end_time)
    elsif datetime_val.tuesday?
      TUE.calculate_price(start_time,end_time)
    elsif datetime_val.wednesday?
      WED.calculate_price(start_time,end_time)
    elsif datetime_val.thursday?
      THU.calculate_price(start_time,end_time)
    elsif datetime_val.friday?
      FRI.calculate_price(start_time,end_time)
    elsif datetime_val.saturday?
      SAT.calculate_price(start_time,end_time)  
    else
      0
    end
  end
end