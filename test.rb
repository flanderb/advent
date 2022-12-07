test = {'/': 0} 

test['this'] = 0

p test


test.each do |dir, size|
    p "#{dir} -> #{size} "
end

test.each do |dir, size|
    test[dir].size += 45
end

test.each do |dir, size|
    p "#{dir} -> #{size} "
end
