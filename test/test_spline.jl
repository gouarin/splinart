using Splinart
using Test



for (b, e) in [(0, 1), (-2, -1), (-20, 10)]

    for nbpoints in [10, 20, 30]

        @testset "line spline nbpoints = $nbpoints " begin

            path = line(b, e, npoints = nbpoints)
            y2s = spline(path[1, :], path[2, :])
            @test y2s ≈ zeros(nbpoints)

        end

    end
end

for (center, radius) in [([0, 0], 1), ([0.5, 0.1], 0.1), ([-0.5, 0.6], 0.3)]

    for nbpoints in [10, 20, 30]

        @testset "circle [$center , $radius] spline nbpoints = $nbpoints " begin
            θ, path = circle(center, radius, npoints = nbpoints)
            y2s = spline(θ, path)
            y_new = zero(path)
            splint!(y_new, θ, path, y2s, θ)
            @test path ≈ y_new
        end

    end

end
