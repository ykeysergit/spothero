require 'json'
require 'date'

class InputAdapter
  attr_reader :start_time, :end_time, :file_path
  
  def initialize(filepath,start_time_str,end_time_str)
    set_filepath(filepath)
    set_start_time(start_time_str)
    set_end_time(end_time_str)
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

  def start_time=(time)
    @start_time=DateTime.iso8601(time)
  end
  
  def end_time=(time)
    @end_time=DateTime.iso8601(time)
  end

  def filepath=(filepath)
    if !File.exists?(filepath)
      raise ArgumentError.new('File does not exist: '+filepath)
    elsif File.directory?(filepath)
      raise ArgumentError.new('filepath is a directory: '+filepath)
    end
    
    @filepath=filepath
  end
end