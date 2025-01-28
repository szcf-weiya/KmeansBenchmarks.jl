module KmeansBenchmarks

include("methods.jl")
include("datasets.jl")
include("evaluate.jl")

arr_methods = (
    r_kmeans_nstart1_HartiganWong = [r_kmeans, Dict(:algorithm => "Hartigan-Wong")],
    r_kmeans_nstart1_Lloyd = [r_kmeans, Dict(:algorithm => "Lloyd")],
    r_kmeans_nstart1_MacQueen = [r_kmeans, Dict(:algorithm => "MacQueen")],

    r_kmeans_nstart10_HartiganWong = [r_kmeans, Dict(:nstart => 10, :algorithm => "Hartigan-Wong")],
    r_kmeans_nstart10_Lloyd = [r_kmeans, Dict(:nstart => 10, :algorithm => "Lloyd")],
    r_kmeans_nstart10_MacQueen = [r_kmeans, Dict(:nstart => 10, :algorithm => "MacQueen")],

    r_kmeanspp_nstart1_ClusterR = [r_kmeanspp_ClusterR, Dict()],
    r_kmeanspp_nstart10_ClusterR = [r_kmeanspp_ClusterR, Dict(:nstart => 10)],

    r_kmeanspp_maotai = [r_kmeanspp_maotai, Dict()],

    jl_kmeanspp = [jl_kmeanspp, Dict()],

    r_kmeans_HartiganWong_with_jl_kmeanspp = [r_kmeans_with_jl_kmeanspp, Dict(:algorithm => "Hartigan-Wong")],
    r_kmeans_Lloyd_with_jl_kmeanspp = [r_kmeans_with_jl_kmeanspp, Dict(:algorithm => "Lloyd")],
    r_kmeans_MacQueen_with_jl_kmeanspp = [r_kmeans_with_jl_kmeanspp, Dict(:algorithm => "MacQueen")],

    # r_kmeans_nstart10_HartiganWong_with_jl_kmeanspp = [r_kmeans_with_jl_kmeanspp, Dict(:nstart => 10, :algorithm => "Hartigan-Wong")],
    # r_kmeans_nstart10_Lloyd_with_jl_kmeanspp = [r_kmeans_with_jl_kmeanspp, Dict(:nstart => 10, :algorithm => "Lloyd")],
    # r_kmeans_nstart10_MacQueen_with_jl_kmeanspp = [r_kmeans_with_jl_kmeanspp, Dict(:nstart => 10, :algorithm => "MacQueen")]
)

arr_data = (
    normal_n1000_p2000_δ0_3 = [gen_data_normal, (1000, 2000, 0.3)],
    normal_n1000_p2000_δ0_4 = [gen_data_normal, (1000, 2000, 0.4)],
    normal_n1000_p2000_δ0_5 = [gen_data_normal, (1000, 2000, 0.5)],
    normal_n1000_p2000_δ0_6 = [gen_data_normal, (1000, 2000, 0.6)],
    normal_n1000_p2000_δ0_7 = [gen_data_normal, (1000, 2000, 0.7)],
)

export arr_data,
       arr_methods,
       benchmark

end