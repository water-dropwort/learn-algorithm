function selectionsort!(xs::Array{T}) where T
    for i = (1:length(xs)-1)
        for j = (i:length(xs))
            if xs[i] > xs[j]
                tmp = xs[i]
                xs[i] = xs[j]
                xs[j] = tmp
            end
        end
    end
end

function selectionsort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    selectionsort!(xs)
    return xs
end
