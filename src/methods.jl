using RCall
using Clustering

function jl_kmeanspp(x::AbstractMatrix, k::Int64 = 2)
    return kmeans(x', k).assignments
end

function r_kmeanspp_ClusterR(x::AbstractMatrix, k::Int64 = 2; nstart::Int64 = 1)
    return Int.(rcopy(R"ClusterR::KMeans_rcpp($x, $k, num_init = $nstart)$cluster"))
end

function r_kmeanspp_maotai(x::AbstractMatrix, k::Int64 = 2)
    return rcopy(R"maotai::kmeanspp($x, 2)")
end

function r_kmeans(x::AbstractMatrix, k::Int64 = 2; nstart = 1, algorithm = "Hartigan-Wong")
    #Lloyd, MacQueen
    return rcopy(R"kmeans($x, $k, iter.max = 100, nstart = $nstart, algorithm = $algorithm)$cluster")
end

function r_kmeans_with_jl_kmeanspp(x::AbstractMatrix, k::Int64 = 2; nstart = 1, algorithm = "Hartigan-Wong")
    center = x[initseeds(:kmpp, x', k), :]
    # nstart only works when center is given as k
    return rcopy(R"kmeans($x, $center, iter.max = 100, nstart = $nstart, algorithm = $algorithm)$cluster")
end
