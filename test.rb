# operations = "  Operation: new = old + 6"
# item = 76
# o = operations.partition("= ").last
# p o
# equation = eval(o.gsub("old", item.to_s ))
# p equation

a = [1,2,3,4,5,6,7,8,9,0]
a.each_with_index do |el, index|
    p index
    b = a.shift
    p b
    p el
    p a
end