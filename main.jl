using SplitClusterTest
using Clustering
using StatsBase
using RCall

function calc_cluster_acc(pred::Vector{Int}, truth::Vector{Int})
    # assume only 1 and 2
    return max(mean(pred .== truth), mean(pred .== 3 .- truth))
end


jl_kmeanspp = x -> kmeans(x', 2).assignments
r_kmeanspp_cluster = x -> Int.(rcopy(R"ClusterR::KMeans_rcpp($x, 2)$cluster"))
r_kmeanspp_cluster_10 = x -> Int.(rcopy(R"ClusterR::KMeans_rcpp($x, 2, num_init = 10)$cluster"))
r_kmeanspp_maotai = x -> rcopy(R"maotai::kmeanspp($x, 2)")
r_HW = x -> rcopy(R"kmeans($x, 2)$cluster")
r_LF = x -> rcopy(R"kmeans($x, 2, algorithm = 'Lloyd')$cluster")
r_MQ = x -> rcopy(R"kmeans($x, 2, algorithm = 'MacQueen')$cluster")

r_HW_10 = x -> rcopy(R"kmeans($x, 2, nstart = 10)$cluster")
r_LF_10 = x -> rcopy(R"kmeans($x, 2, algorithm = 'Lloyd', nstart = 10)$cluster")
r_MQ_10 = x -> rcopy(R"kmeans($x, 2, algorithm = 'MacQueen', nstart = 10)$cluster")

function scripts()
    x, cl = gen_data_normal(1000, 2000, 0.3, prop_imp=0.1);

end