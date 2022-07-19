include("mergesort.jl")

function itr_mergesort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    itr_mergesort!(xscopy)
    return xscopy
end

function itr_mergesort!(xs::Array{T}) where T
    currsize = 1
    n = length(xs)
    while currsize < n
        for st = (1:2*currsize:n-1)
            mid = min(st + currsize - 1, n-1)
            en = min(st + 2*currsize - 1, n)
            merge!(xs, st, mid, en)
        end

        currsize = 2*currsize
    end
end
