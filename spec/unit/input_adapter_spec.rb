require 'spec_helper'
require 'app/adapters/input_adapter'
require 'unit/shared_examples/input_adapter_example'

describe App::Adapters::InputAdapter do
  include_examples 'input adapter'
  
  context 'valid input' do
    before do
      expect(File.exists?(filepath_str)).to be_truthy
    end
 
    it 'shall adapt input' do
      expect(input_adapter.filepath).to eq(filepath_str)
      expect(input_adapter.start_time.kind_of?(DateTime)).to be_truthy
      expect(input_adapter.end_time.kind_of?(DateTime)).to be_truthy
    end
    
    it 'shall parse input json' do
      json=input_adapter.to_rates_h
      
      expect(json).to be_truthy
      expect(json['rates']).to be_truthy
      expect(json['rates'].length).to eq(2)
      expect(json['rates'][0]['days']).to eq('mon,tues,wed,thurs,fri')
      expect(json['rates'][0]['times']).to eq('0600-1800')
      expect(json['rates'][0]['price']).to eq(1500)
    end
  end
end
