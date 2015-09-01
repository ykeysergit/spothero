require 'spec_helper'
require 'app/adapters/input_adapter'
require 'app/app_namespace'

describe App::Adapters::InputAdapter do
  let(:input_adapter){App::Adapters::InputAdapter.new(filepath_str, start_time_str,end_time_str)}
  
  context 'valid input' do
    let(:filepath_str){File.expand_path('config/sample_data/basic_rates.json', File.dirname(__FILE__))}
    let(:start_time_str){'2015-07-01T07:00:00Z'}
    let(:end_time_str){'2015-07-01T12:00:00Z'}
    
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
