using StatsBase

function evaluate(x::AbstractMatrix, cl::AbstractVector, f::Function, paras = Dict())
    dt = @elapsed pred = f(x; paras...)
    acc = calc_cluster_acc(pred, cl)
    WSS = wss(x, pred)
    return acc, WSS, dt
end

"""
    benchmark(arr_data::NamedTuple, arr_methods::NamedTuple)

Run the benchmark experiments for all methods in `arr_methods` on each dataset in `arr_data`.
"""
function benchmark(arr_data::NamedTuple, arr_methods::NamedTuple)
    ndata = length(arr_data)
    nmethod = length(arr_methods)
    RES = Array{Any, 1}(undef, ndata)
    for i in 1:ndata
        x, cl = arr_data[i][1](arr_data[i][2]...)
        res = zeros(nmethod, 3)
        TSS = calc_dist2(x)
        for j in 1:nmethod
            res[j, :] .= evaluate(x, cl, arr_methods[j][1], arr_methods[j][2])
            res[j, 2] = 1 - res[j, 2] / TSS # calculate BSS / TSS
        end
        RES[i] = res
    end
    return RES
end

function calc_cluster_acc(pred::Vector{Int}, truth::Vector{Int})
    # assume only 1 and 2
    return max(mean(pred .== truth), mean(pred .== 3 .- truth))
end

## TODO: add total distance, within distance

function calc_dist(x::AbstractMatrix)
    n, p = size(x)
    d = 0.0
    for i in 1:n-1
        for j in i:n
            d += sum((x[i, :] .- x[j, :]).^2)
        end
    end
    return d
end

function calc_dist2(x::AbstractMatrix)
    μ = mean(x, dims = 1)[:]
    n, p = size(x)
    d = 0.0
    for i in 1:n
        d += sum((x[i, :] - μ).^2)
    end
    # equivalent to calc_dist (see the derivation at https://esl.hohoweiya.xyz/14-Unsupervised-Learning/14.3-Cluster-Analysis/index.html#k-means)
    # but different from the within-scatter
    return d
end

function wss(x::AbstractMatrix, cl::AbstractVector)
    k = maximum(cl)
    res = zeros(k)
    for i = 1:k
        res[i] = calc_dist2(x[cl .== i, :])
    end
    return sum(res)
end

