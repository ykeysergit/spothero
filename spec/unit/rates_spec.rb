require 'spec_helper'
require 'app/domain/rate/rates'
require 'unit/shared_examples/rates_adapter_example'

describe App::Domain::Rate::Rates do
  include_examples 'rates adapter example'
  
  context 'Saturday' do
    context 'start at 7am' do
      let(:filepath_str){File.expand_path('config/sample_data/basic_rates.json', File.dirname(__FILE__))}
      let(:start_time_str){'2015-07-01T07:00:00Z'}
      
      context 'finish at 12pm' do
        let(:end_time_str){'2015-07-01T12:00:00Z'}
        
        it 'shall cost 7500' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(7500)
        end
      end
    end
  end
  
  context 'Monday' do
    context 'start at 9pm' do
      let(:start_time_str){'2015-08-31T21:00:00Z'}
      
      context 'end at 10pm' do
        let(:end_time_str){'2015-08-31T22:00:00Z'}
        
        it 'shall cost 0' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(0)
        end 
      end
    end
    
    context 'start at 5am' do
      let(:start_time_str){'2015-08-31T05:00:00Z'}
      
      context 'end at 5am' do
        let(:end_time_str){'2015-08-31T05:00:00Z'}
        
        it 'shall cost 0' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(0)
        end  
      end
      
      context 'end at 6am' do
        let(:end_time_str){'2015-08-31T06:00:00Z'}
        
        it 'shall cost 0' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(0)
        end  
      end
      
      context 'end at 9am' do
        let(:end_time_str){'2015-08-31T09:00:00Z'}
        
        it 'shall cost 0' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(0)
        end  
      end
    end
    
    context 'start at 9am' do
      let(:start_time_str){'2015-08-31T09:00:00Z'}
      
      context 'end at 10am' do
        let(:end_time_str){'2015-08-31T10:00:00Z'}

        it 'shall cost 1500' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(1500)
        end    
      end
      
      context 'end at 12pm' do
        let(:end_time_str){'2015-08-31T12:00:00Z'}
        
        it 'shall cost 4500' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(4500)
        end
      end
      
      context 'end at 9pm' do
        let(:end_time_str){'2015-08-31T21:00:00Z'}
        
        it 'shall cost 4500' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(18000)
        end
      end
      
      context 'end at 11pm' do
        let(:end_time_str){'2015-08-31T23:00:00Z'}
        
        it 'shall cost 0' do
          price=rates_composite.calculate_price(input_adapter.start_time,input_adapter.end_time)
          expect(price).to eq(0)
        end
      end
    end
  end
end
