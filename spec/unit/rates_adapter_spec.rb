require 'spec_helper'
require 'app/adapters/input_adapter'
require 'app/adapters/rates_adapter'

describe RatesAdapter do
  let(:filepath_str){File.expand_path('config/sample_data/indepth_rates.json', File.dirname(__FILE__))}
  let(:start_time_str){'2015-07-01T07:00:00Z'}
  let(:end_time_str){'2015-07-01T12:00:00Z'}
  let(:input_adapter){InputAdapter.new(filepath_str,start_time_str,end_time_str)}
  let(:rates_hash){input_adapter.to_rates_h}
  let(:rates_adapter){RatesAdapter.new(rates_hash)}
  let(:rates_composite){rates_adapter.adapt}
  
  before do
    #puts rates_hash
  end
  
  it 'shall create a composite structure' do
    #puts rates_adapter.adapt.to_s
    
    expect(rates_composite).to be_truthy
    expect(rates_composite.to_h['rates']).to be_truthy
    expect(rates_composite.to_h['rates']['sun']).to be_truthy
  end
end
