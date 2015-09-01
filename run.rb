$LOAD_PATH.unshift('./src',File.dirname(__FILE__))
require 'app/driver'
puts "filepath: #{ARGV[0]}, start_time: #{ARGV[1]}, end_time: #{ARGV[2]}"
App::Driver.new(ARGV[0],ARGV[1],ARGV[2]).run
