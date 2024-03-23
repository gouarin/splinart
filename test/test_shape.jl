using Splinart
using Test


@testset "circle 1" begin

    theta, path = circle([0, 0], 1, npoints = 2)
    @test theta ≈ [0, 2pi]
    @test path ≈ stack([[1, 0], [1, 0]])
end


@testset "circle 2" begin
    theta, path = circle([0, 0], 1, npoints = 5)

    @test theta ≈ LinRange(0, 2pi, 5)
    @test path ≈ stack([[1, 0], [0, 1], [-1, 0], [0, -1], [1, 0]])
end


@testset "line 1" begin
    path = line(0, 1, npoints = 2)
    @test path ≈ stack([[0, 0.5], [1, 0.5]])
end


@testset "line 2" begin
    @show path = line(0, 1, npoints = 3)
    @test path ≈ stack([[0, 0.5], [0.5, 0.5], [1, 0.5]])
end


for (nbpoints, expected) in
    [(2, [[1, 0], [1, 0]]), (5, [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 0]])]

    @testset " circle $nbpoints $expected" begin
        theta, path = circle([0, 0], 1, npoints = nbpoints)
        @test path ≈ stack(expected)
    end

end


for (nbpoints, expected) in
    [(2, [[0, 0.5], [1, 0.5]]), (3, [[0, 0.5], [0.5, 0.5], [1, 0.5]])]

    @testset "test line $nbpoints $expected" begin
        path = line(0, 1, npoints = nbpoints)
        @test path ≈ stack(expected)
    end

end
