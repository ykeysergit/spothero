require 'spec_helper'
require 'app/domain/rate/rates'
require 'unit/shared_examples/rates_adapter_example'

describe App::Domain::Rate::Rates do
  include_examples 'rates adapter example'
  
  
  context 'Monday' do
    context 'start at 9am' do
      let(:start_time_str){'2015-08-31T09:00:00Z'}
      
      context 'end at 10am' do
        let(:end_time_str){'2015-08-31T10:00:00Z'}
        let(:rates_adapter){App::Adapters::RatesAdapter.new(rates_hash)}
        
        it 'shall cost 1500' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(1500)
        end    
      end
      
      context 'end at 12pm' do
        let(:end_time_str){'2015-08-31T12:00:00Z'}
        let(:rates_adapter){App::Adapters::RatesAdapter.new(rates_hash)}
        
        before do
          puts rates_composite  
        end
        
        it 'shall cost 4500' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(4500)
        end
      end
    end
  end
end
