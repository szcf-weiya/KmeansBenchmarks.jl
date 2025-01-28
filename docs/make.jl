ENV["PLOTS_TEST"] = "true"
ENV["GKSwstype"] = "100"

using KmeansBenchmarks
using Documenter
using Literate

file = "benchmarks.jl"
indir = joinpath(@__DIR__, "..", "benchmarks")
outdir = joinpath(@__DIR__, "src")

Literate.markdown(joinpath(indir, file), outdir; credit = false)

makedocs(sitename = "KmeansBenchmarks.jl",
        pages = [
            "Home" => "index.md",
            "Benchmarks" => "benchmarks.md",
            "API" => "api.md"
        ],
        format = Documenter.HTML(
            example_size_threshold = 5_000_000,
            size_threshold = 10_000_000,
            size_threshold_warn = 5_000_000,
            # not work even at the end of the header
            # assets = [
            #     # "assets/00_plotly-2.6.3.min.js"
            #     # "assets/loader_plotly.js"
            #     # although it automatically generates the script, but I found it is not inside the header
            #     #asset("https://cdn.plot.ly/plotly-2.6.3.min.js")
            # ]
        ))


function inject_plotly_script()
    html_files = [joinpath(@__DIR__, "build/benchmarks/index.html")]
    plotly_script = """
    <script src="https://cdn.plot.ly/plotly-2.6.3.min.js"></script>
    """

    for file in html_files
        @info "inject plotly.js to $file"
        content = read(file, String)
        modified_content = replace(content, "<head>" => "<head>" * plotly_script)
        write(file, modified_content)
    end
end

inject_plotly_script()

deploydocs(
    repo = "github.com/szcf-weiya/KmeansBenchmarks.jl"
)