nums = Array.new(10) { |e| e = e * 3 }
nums.each do |n| 
   puts n
end

a = ('a'..'z').to_a
b = a.collect{|x| "a"+x}
puts b

