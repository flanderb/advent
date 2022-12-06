def find_first_marker(stream)
    x = 14 
    stream.each_char.with_index(x) do |char, i|
        p i
        # p "stream[#{i}..#{i + 4}]"
        temp_array = stream[i-x..i].chars.uniq
        p temp_array
        p temp_array.size
        if temp_array.size == x 
            x = i
            break
        end
    end
    return x + 1
end

test = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
test1 = "bvwbjplbgvbhsrlpgdmjqwftvncz"
test2 = "nppdvjthqldpwncqszvftbrmjlhg" #missing q between c and s why
test3 = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

p find_first_marker(test2)
