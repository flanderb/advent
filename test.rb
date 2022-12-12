t = "noop\naddx 3\naddx -5"

t.each_line do |line|
    i, n = line.split
    p i 
    p n 
end


a = [1,2,3,4,5,6,7,8,9]
line = ""
a.each_with_index do |item, i|
    line << item.to_s
end

p line