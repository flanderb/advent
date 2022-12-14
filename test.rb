operations = "  Operation: new = old + 6"
item = 76
o = operations.partition("= ").last
p o
equation = eval(o.gsub("old", item.to_s ))/3
p equation

