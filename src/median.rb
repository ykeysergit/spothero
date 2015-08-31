def median_linear(array1,array2)
  output=[]
  iter1,iter2=0,0
  total_len=array1.length+array2.length
  
  while iter1 < array1.length && iter2 < array2.length
    if array1[iter1] < array2[iter2]
      output << array1[iter1]
      iter1+=1
    else
      output << array2[iter2]
      iter2+=1
    end
  end

 
  (iter1...array1.length).each do |iter|
    output << array1[iter] if total_len.even? && output.length < total_len/2+1
    output << array1[iter] if total_len.odd? && output.length < total_len/2
  end
  
  (iter2...array2.length).each do |iter|
    output << array2[iter] if total_len.even? && output.length < total_len/2+1
    output << array2[iter] if total_len.odd? && output.length < total_len/2
  end
  
  puts "Output: #{output}"
  
  (output[output.length-1]+output[output.length-2])/2.0
end

array1=[1,2,3]
array2=[4,5,6]

puts "Median: #{median_linear(array1,array2)}"
