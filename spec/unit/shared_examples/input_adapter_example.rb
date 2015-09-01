require 'app/adapters/input_adapter'

shared_examples 'input adapter' do
  let(:input_adapter){App::Adapters::InputAdapter.new(filepath_str, start_time_str,end_time_str)}
  let(:filepath_str){File.expand_path('../config/sample_data/basic_rates.json', File.dirname(__FILE__))}
  let(:start_time_str){'2015-07-01T07:00:00Z'}
  let(:end_time_str){'2015-07-01T12:00:00Z'}
end
