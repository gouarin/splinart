using Splinart

img_size = 1000
img = ones(Int, (img_size, img_size))

function xs_func()
    nsamples = 500
    return 0.001 * rand() .+ LinRange(lo + 0.1, up - 0.1, nsamples)
end


lo, up = 0.2, 0.8
path = line(lo, up, 0.5)

update_img!(img, path, xs_func, nrep = 1000, periodic = false)

save_img(img, "./output", "line.png")
