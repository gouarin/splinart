using Documenter
using Splinart

ENV["GKSwstype"] = "100"

makedocs(;
    sitename = "Splinart.jl",
    authors = "Loic Gouarin",
    modules = [Splinart],
    warnonly = true,
    checkdocs = :all,
    format = Documenter.HTML(;
        repolink = "github.com/pnavaro/Splinart.jl",
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://pnavaro.github.io/Splinart.jl",
        edit_link = "main",
        assets = String[],
    ),
    draft = false,
    source = "src",
    build = "build",
    pages = [
        "Splinart.jl" => "index.md",
        "Cubic Spline" => "spline.md",
        "Splinart on a circle" => "circle.md",
        "Functions" => "api.md",
    ],
)


deploydocs(;
    repo = "github.com/pnavaro/Splinart.jl",
    target = "build",
    branch = "gh-pages",
    devbranch = "main",
    push_preview = true,
)
