function quicksort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    quicksort!(xscopy)
    return xscopy
end

function quicksort!(xs::Array{T}) where T
    _quicksort!(xs, 1, length(xs))
end

function _quicksort!(xs::Array{T}, st, en) where T
    if st < en
        patindex = partition!(xs, st, en)
        _quicksort!(xs, st, patindex-1)
        _quicksort!(xs, patindex, en)
    end
end

function partition!(xs::Array{T}, st, en) where T
    if st >= en
        return st
    end

    pivot = xs[Int(floor((st+en)/2))]

    i = st
    j = en

    while true
        while xs[i] < pivot ; i = i + 1 ; end
        while xs[j] > pivot ; j = j - 1 ; end
        if i >= j
            return j + 1
        else
            tmp = xs[i]
            xs[i] = xs[j]
            xs[j] = tmp
            i = i + 1
            j = j - 1
        end
    end
end
