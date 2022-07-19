function heapify!(arr::Array{T}, n, i) where T
    largest = i
    left = 2 * i
    right = left + 1

    if left <= n && arr[left] > arr[largest]
        largest = left
    end
    if right <= n && arr[right] > arr[largest]
        largest = right
    end

    if largest != i
        temp = arr[i];arr[i] = arr[largest];arr[largest] = temp

        heapify!(arr,n,largest)
    end
end

function heapsort!(xs::Array{T}) where T
    n = length(xs)
    i_st = Int(floor(n/2))

    for i = (i_st:-1:1)
        heapify!(xs, n, i)
    end

    for i = (n:-1:2)
        temp = xs[1];xs[1] = xs[i];xs[i] = temp
        
        heapify!(xs, i-1, 1)
    end
end

function heapsort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    heapsort!(xscopy)
    return xscopy
end
