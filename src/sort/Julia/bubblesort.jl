# バブルソート
function bubblesort!(xs::Array{T}) where T
    for i = (1:length(xs)-1)
        for j = (1:length(xs)-i)
            if xs[j] > xs[j+1]
                tmp = xs[j]
                xs[j] = xs[j+1]
                xs[j+1] = tmp
            end
        end
    end
end

function bubblesort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    bubblesort!(xscopy)
    return xscopy
end

# 再帰版バブルソート
function bubblesortr!(xs::Array{T}) where T
    _bubblesortr!(xs, length(xs))
end

function bubblesortr(xs::Array{T}) where T
    xscopy = [x for x in xs]
    bubblesortr!(xscopy)
    return xscopy
end

function _bubblesortr!(xs::Array{T}, n) where T
    if n <= 1
        return
    end

    for i = (1:n-1)
        if xs[i] > xs[i+1]
            tmp = xs[i]
            xs[i] = xs[i+1]
            xs[i+1] = tmp
        end
    end

    _bubblesortr!(xs,n-1)
end
