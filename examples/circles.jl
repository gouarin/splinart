using Splinart

img_size = 1000
img = ones(Int, (img_size, img_size, channels))

nb_circles = 10
theta_circles = []
path_circles = []
color_circles = []
for i = 1:nb_circles
    radius = 0.1 + rand() * 0.1
    center = 0.2 + rand(2) * 0.6
    theta, path = circle(center, radius, npoints = 75)
    push!(theta_circles, theta)
    push!(path_circles, path)
    color = rand(4) .* 0.3
    color[end] = 1.0
    push!(color_circles, color)
end


function xs_func()
    nsamples = 500
    mod2pi.(rand() .+ 2pi .* LinRange(0, 1, nsamples))
end


for i = 1:nb_circles
    img1 = np.ones_like(img)
    update_img!(
        img1,
        path_circles[i],
        theta_circles[i],
        xs_func,
        nrep = 1000,
        scale_value = 0.00005,
        #color=color_circles[i],
    )
    mask = img1 .< 1.0
    img[mask] .+= img1[mask]
end

save_img(img, "./output", "circles.png")
