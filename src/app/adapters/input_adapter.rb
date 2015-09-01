require 'json'
require 'date'

module App
  module Adapters
    class InputAdapter
      attr_reader :start_time, :end_time, :filepath
      
      def initialize(filepath_str,start_time_str,end_time_str) 
        self.filepath=(filepath_str)
        self.start_time=(start_time_str)
        self.end_time=(end_time_str)
      end
      
      def to_h
        {start_time: @start_time, end_time: @end_time, filepath: @filepath}
      end
      
      def to_json
        JSON.generate(to_h)
      end
      
      def to_s
        to_json
      end
      
      def to_rates_h
        if !filepath
          throw RuntimeError.new('filepath is blank')
        end
        
        JSON.parse(File.read(@filepath))
      end
    
      def start_time=(time)
        @start_time=DateTime.iso8601(time)
      end
      
      def end_time=(time)
        @end_time=DateTime.iso8601(time)
      end
    
      def filepath=(filepath_str)
        if !File.exists?(filepath_str)
          raise ArgumentError.new('File does not exist: '+filepath_str)
        elsif File.directory?(filepath_str)
          raise ArgumentError.new('filepath is a directory: '+filepath_str)
        end
        
        @filepath=filepath_str
      end
    end
  end
end