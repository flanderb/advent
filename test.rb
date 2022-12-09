def move_tail(head, tail)
    x_diff = head[0] - tail[0]
    y_diff = head[1] - tail[1]

    if xdiff.abs == 2 || y_diff.abs == 2
        #move 1 in x 
        if head[0] > tail[0]
            tail[0] += 1
        elsif head[0] < tail[0]
            tail[0] -= 1
        end
                
        #and 1 in y
        if head[1] > tail[1]
            tail[1] += 1
        elsif head[1] < tail[1]
            tail[1] -= 1
        end
    end

    case dir
    when "U"
        tail[1] += 1
    when "D"
        tail[1] -= 1
    when "L"
        tail[0] -= 1
    when "R"
        tail[0] += 1
    end
    return tail

end

t1 = [0,0]
h1 = [0,0]
h2 = [0,1]
h3 = [1,0]
h4 = [1,1]
h5 = [0,2]
h6 = [1,1]



# head = h1
tail = t1
head_moves = [h1, h2, h3, h4, h5, h6]
head_moves.each do |head|
    p move_tail(head, tail)
end