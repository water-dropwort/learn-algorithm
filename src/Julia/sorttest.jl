using Combinatorics

function issorted(xs::Array{T}) where T
    for i = (2:length(xs))
        if xs[i-1] > xs[i]
            return false
        end
    end
    return true
end

function testsort(fsort)
    tests = [(f -> issorted(f([1]))) ,
             (f -> permutations_testsort(f,[1,2,3])) ,
             (f -> permutations_testsort(f,[1,2,3,4])) ,
             (f -> random_testsort(f))]
    for testf in tests
        res = testf(fsort)
        if res == false ; return false; end
    end

    return true
end

function permutations_testsort(fsort, src)
    return array_test(fsort, permutations(src))
end

function random_testsort(fsort)
    return array_test(fsort, [rand(9) for i in (1:20)])
end

function array_test(fsort, itr)
    for xs in itr
        ys = fsort(xs)
        if false == issorted(ys)
            print("Failed to sort. " * string(xs) * "-->" * string(ys) * ".\n")
            return false
        end
    end
    return true
end
