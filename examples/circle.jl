using Splinart

img_size = 1000
img = ones((img_size, img_size))

theta, path = circle([0.5, 0.5], 0.3, npoints = 40)

function xs_func()
    nsamples = 500
    mod2pi.(rand() .+ 2π .* LinRange(0, 1, nsamples))
end

update_img!(img, path, xs_func, theta, nrep = 1000, scale_value = 0.0001)

save_img(img, "./output", "circle.png")

show_img(img)
