require 'app/adapters/rates_adapter'
require 'unit/shared_examples/input_adapter_example'

shared_examples 'rates adapter example' do
  include_examples 'input adapter' 
  
  let(:filepath_str){File.expand_path('../config/sample_data/indepth_rates.json', File.dirname(__FILE__))}
  let(:rates_hash){input_adapter.to_rates_h}
  let(:rates_adapter){App::Adapters::RatesAdapter.new(rates_hash)}
  let(:rates_composite){rates_adapter.adapt}
end
