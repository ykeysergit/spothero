require 'app/adapters/input_adapter'
require 'app/adapters/rates_adapter'
require 'fileutils'

module App
  class Driver
    MY_SOLUTION_DIR='keyser_yevgeny_spothero_rates'
    
    def initialize(filepath,start_time_str,end_time_str)
      @input_adapter=App::Adapters::InputAdapter.new(filepath,start_time_str,end_time_str)
      @rates_composite=App::Adapters::RatesAdapter.new(@input_adapter.to_rates_h).adapt
    end
    
    def run
      price=@rates_composite.calculate_price(@input_adapter.start_time,@input_adapter.end_time)
      write_result(price)
    end
    
    #
    # protected
    protected
    def write_result(price)
      base_dir=File.expand_path('../../', File.dirname(__FILE__))
      dirs=Dir.entries(base_dir)
      
      solution_directory=dirs.find do |directory|
        directory==MY_SOLUTION_DIR
      end
      
      if(solution_directory.nil?)
        Dir.mkdir(File.expand_path("../../#{MY_SOLUTION_DIR}",File.dirname(__FILE__)))
      end
      
      price='unavailable' if price===0
      content="Input criteria: #{@input_adapter}\n\n"+"Optimized JSON: \n#{@rates_composite.to_json}\n\n"+"Price: #{price}"
      
      
      File.write(base_dir+'/'+MY_SOLUTION_DIR+'/'+Date.today.strftime('%m%d%Y')+'.txt',content)
    end
  end
end