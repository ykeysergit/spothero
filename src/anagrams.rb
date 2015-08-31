require 'set'

def anagrams_count(array)
  return 0 if array.nil? || !array.kind_of?(Array) || array.length == 0
  
  anagrams_set=Set.new
  
  array.each do |str|
    sorted_str=str.chars.sort.join
    anagrams_set.add(sorted_str)
  end
  
  anagrams_set.size
end