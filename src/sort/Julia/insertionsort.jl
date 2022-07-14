# 挿入ソート
function insertionsort!(xs::Array{T}) where T
    for i = (2:length(xs))
        j = i
        while j >= 2
            if xs[j] < xs[j-1]
                tmp = xs[j-1]
                xs[j-1] = xs[j]
                xs[j] = tmp
            else
                break
            end
            j = j-1
        end
    end
end

function insertionsort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    insertionsort!(xscopy)
    return xscopy
end
