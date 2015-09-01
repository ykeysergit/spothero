$LOAD_PATH.unshift('../',File.dir(__FILE__))
require 'app/adapters/input_adapter'

class Driver
  def initialize
    @input_adapter=InputAdapter.new(argv[0],argv[1],argv[2])
  end
  
  def run
    
  end
end