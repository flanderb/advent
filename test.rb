t = "noop\naddx 3\naddx -5"

t.each_line do |line|
    i, n = line.split
    p i 
    p n 
end

