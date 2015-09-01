$LOAD_PATH.unshift('../',File.dir(__FILE__))
require 'app/adapters/input_adapter'
require 'app/adapters/rates_adapter'
require 'fileutils'

class Driver
  def initialize
    @input_adapter=InputAdapter.new(argv[0],argv[1],argv[2])
    @rates_composite=RatesAdapter.new(@input_adapter.to_rates_h).adapt
  end
  
  def run
    price=@rates_composite.calculate_price(@input_adapter.start_time,@input_adapter.end_time)
    write_result(price)
  end
  
  #
  # protected
  protected
  def write_result(price)
    base_dir=File.expand_path('../../'), File.dirname(__FILE__)
    
    solution_directory=Dir.entries(base_dir).find do |directory|
      directory=='keyser_yevgeny_spothero_rates'
    end
    
    if(solution_directory.nil?)
      Dir.mkdir(File.expand_path("../../keyser_yevgeny_spothero_rates",File.dirname(__FILE__)))
    end
    
    content="
      #{@input_adapter}
      
      #{@rates_composite}
      
      Price: #{price}
    "
    
    File.write(base_dir+'/'+solution_directory+'/'+Date.today.strftime('%d%m%Y')+'.txt',content)
  end
end