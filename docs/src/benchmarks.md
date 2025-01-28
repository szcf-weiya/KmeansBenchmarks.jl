```@meta
EditURL = "../../benchmarks/benchmarks.jl"
```

````@example benchmarks
using KmeansBenchmarks
using Plots
using StatsPlots
using DataFrames

plotly()
````

repeat two times

````@example benchmarks
nrep = 2
res = [benchmark(arr_data, arr_methods) for _ in 1:nrep]

df = DataFrame(hcat(repeat(repeat(collect(keys(arr_data)), inner=length(arr_methods)), outer = nrep),
                repeat(repeat(collect(keys(arr_methods)), outer=length(arr_data)), outer = nrep),
                vcat([vcat(r...) for r in res]...)), ["data", "method", "Acc", "BSS/TSS", "Time"]);
nothing #hide
````

display the first element

````@example benchmarks
df1 = DataFrame(hcat(repeat(collect(keys(arr_data)), inner=length(arr_methods)),
                repeat(collect(keys(arr_methods)), outer=length(arr_data)),
                vcat(res[1]...)), ["data", "method", "Acc", "BSS/TSS", "Time"])
````

Calculate the accuracy by comparing the true clustering label and the predicted label

````@example benchmarks
groupedboxplot([z[end-4:end] for z in string.(df[:, :data])], df[:, :Acc],
        group = string.(df[:, :method]), legend = :outerbottomright,
        size = (1600, 800),
        xlab = "signal strength", ylab = "accuracy",
        title = "Gaussian (n = 1000, p = 2000)")
````

Also the ratio of BSS/TSS

````@example benchmarks
groupedboxplot([z[end-4:end] for z in string.(df[:, :data])], df[:, "BSS/TSS"],
        group = string.(df[:, :method]), legend = :outerbottomright,
        size = (1600, 800),
        xlab = "signal strength", ylab = "BSS/TSS",
        title = "Gaussian (n = 1000, p = 2000)")
````

And the running time

````@example benchmarks
groupedboxplot([z[end-4:end] for z in string.(df[:, :data])], df[:, "Time"],
        group = string.(df[:, :method]), legend = :outerbottomright,
        size = (1600, 800),
        xlab = "signal strength", ylab = "Time",
        title = "Gaussian (n = 1000, p = 2000)")
````

