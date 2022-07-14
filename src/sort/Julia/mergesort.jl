## マージソート
function mergesort(xs::Array{T}) where T
    xscopy = [x for x in xs]
    mergesort!(xscopy)
    return xscopy
end

## マージソート(引数の配列を直接更新する)
function mergesort!(xs::Array{T}) where T
    return _mergesort!(xs,1,length(xs))
end

## 内部呼出用マージソート処理本体
function _mergesort!(arr::Array{T}, st, en) where T
    if (st < en)
        mid = Int(floor((st + en) / 2))
        _mergesort!(arr,st,mid)
        _mergesort!(arr,mid+1,en)
        merge!(arr,st,mid,en)
    end
end

## マージ
## arr[st..m] と arr[m+1..en] の範囲をマージする
function merge!(arr::Array{T},st,m,en) where T
    larr = [arr[i] for i in (st:m)]
    rarr = [arr[i] for i in (m+1:en)]
    llen = length(larr)
    rlen = length(rarr)

    lidx = 1
    ridx = 1
    i = st
    while (lidx <= llen && ridx <= rlen)
        if(larr[lidx] < rarr[ridx])
            arr[i] = larr[lidx]
            lidx = lidx + 1
        else
            arr[i] = rarr[ridx]
            ridx = ridx + 1
        end
        i = i + 1
    end

    if (lidx > llen)
        while (ridx <= rlen)
            arr[i] = rarr[ridx]
            ridx = ridx + 1
            i = i + 1
        end
    else
        while (lidx <= llen)
            arr[i] = larr[lidx]
            lidx = lidx + 1
            i = i + 1
        end
    end
end
