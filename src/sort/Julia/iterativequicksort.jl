include("quicksort.jl")

function itr_quicksort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    itr_quicksort!(xscopy)
    return xscopy
end

function itr_quicksort!(xs::Array{T}) where T
    if length(xs) <= 1; return; end

    stack = Array{Int}(undef, length(xs))
    top = 1; stack[top] = 1
    top = top + 1; stack[top] = length(xs)

    while (top >= 1)
        en = stack[top]; top = top - 1
        st = stack[top]; top = top - 1

        p = partition!(xs, st, en)

        if p - 1 > st
            top = top + 1; stack[top] = st
            top = top + 1; stack[top] = p - 1
        end

        if p < en
            top = top + 1; stack[top] = p
            top = top + 1; stack[top] = en
        end
    end
end
