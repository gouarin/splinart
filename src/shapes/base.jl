# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause
#

export circle

"""
$(SIGNATURES)

Discretization of a circle.

Parameters
----------
- `center` : 2d coordinates of the center.
- `radius` : Radius of the circle.
- `npoints` : Number of discretization points (the default value is 50).

Returns
-------
- The theta angle.
- The 2d coordinates of the circle.

"""
function circle(center, radius; npoints = 50)
    θ = collect(2π .* LinRange(0, 1, npoints))
    path = stack([center[1] .+ radius .* cos.(θ), center[2] .+ radius .* sin.(θ)], dims = 1)
    return θ, path
end

export line

"""
$(SIGNATURES)

Discretization of a horizontal line.

Parameters
----------
- `begin` : The left point of the line.
- `end` : The right point of the line.
- `ypos` : The position of the y coordinate (the default value is 0.5).
- `npoints` : Number of discretization points (the default value is 50).

Returns
-------
- The 2d coordinates of the line.

"""
function line(b, e; ypos = 0.5, npoints = 50)
    x = LinRange(b, e, npoints)
    y = ypos .* ones(npoints)
    return stack([x, y], dims = 1)
end
