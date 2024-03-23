using Splinart

img_size = 1000
img = ones(Int, (img_size, img_size))

lo, up = 0.2, 0.8
path = []
color_lines = []
npoints = 20
for (iy, y) in enumerate(LinRange(lo, up, 10))
    npoints += 5
    push!(path, line(lo, up, y, npoints))
    color = rand(4) .* 0.3
    color[end] = 1.0
    push!(color_lines, color)
end


function xs_func()
    nsamples = 500
    return 0.001 * rand() .+ LinRange(lo + 0.02, up - 0.02, nsamples)
end


for i in eachindex(path)
    img1 = one(img)
    update_img!(
        img1,
        path[i],
        xs_func,
        nrep = 1000,
        periodic = false,
        color = color_lines[i],
    )
    mask = img1 .< 2
    img[mask] .+= img1[mask]
end

save_img(img, "./output", "lines.png")
