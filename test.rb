def find_first_marker(stream, size_of_marker)
    z = size_of_marker - 1
    stream.each_char.with_index(z) do |char, i|
        p "i = #{i}; z=#{z} "
        p "stream[#{i-z}..#{i}]"
        temp_array = stream[i-z..i].chars
        p temp_array
        temp_array = temp_array.uniq
        p temp_array
        if temp_array.size == size_of_marker
            z = i
            break
        end
    end
    return z + 1
end

test = "mjqjpqmgbljsphdztnvjfqwrcgsmlb" #19
test1 = "bvwbjplbgvbhsrlpgdmjqwftvncz" #23
test2 = "nppdvjthqldpwncqszvftbrmjlhg" #23 missing q between c and s why
test3 = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" #26

p find_first_marker(test3, 14)
