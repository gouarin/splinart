using Splinart
using Test
using Plots
using Random

@testset "circle case" begin

    img_size = 1000
    img = ones(Int, (img_size, img_size))

    theta, path = circle([0.5, 0.5], 0.3)

    function xs_func()
        nsamples = 500
        return mod2pi.(rand() .+ (2π .* LinRange(0, 1, nsamples)))
    end

    update_img!(img, path, xs_func, theta, nrep = 4000)

    @test true

end
