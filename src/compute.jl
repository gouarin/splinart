# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause

export update_path!


"""
$(SIGNATURES)

Update the path of the spline.

We move each point of the path by a random vector
defined inside a circle where

- the `center` is the point of the path
- the `radius` is a random number between [-1, 1]

Parameters
----------
- `path` : The y coordinate of the cubic spline.
- `periodic` : If `true`, the first and the last points of the
    path are the same (the default value is `false`).
- `scale_value` : Rescale the random radius (default value is 0.00001).

"""
function update_path!(path; scale_value = 0.00001, periodic = false)
    n = size(path, 2)
    scale = collect(0:(n-1)) .* scale_value
    radius = 1.0 .- 2.0 .* rand(n)
    noise = radius .* scale
    phi = rand(n) .* 2pi
    rnd = stack([cos.(phi), sin.(phi)], dims = 1)
    path .+= rnd .* noise'
    if periodic
        path[:, end] .= path[:, 1]
    end
end

export update_img!

"""
$(SIGNATURES)

Update the image using a cubic spline on a shape.

Parameters
----------
- `img` : The output image.
- `path` : The y coordinate of the cubic spline if x is not None,
    the coordinates of the cubic spline if x is None.
- `x` : The x coordinates of the cubic spline if given.
    (the default value is None)
- `xs_func` : The function that return the x coordinate of the sampling points
    where to compute the y coordinates given the spline equation.
- `nrep` : Number of iteration (default is 300).
- `periodic` : Define if the first and last points of the path must be equal
    (default is true).
- `scale_value` : Rescale the random radius (default value is 0.00001).

See Also
--------

[`update_path!`](@ref)

"""
function update_img!(
    img,
    path,
    xs_func,
    x;
    nrep = 300,
    scale_value = 0.00001,
    periodic = true,
)
    xspline = xs_func()
    yspline = zeros((2, length(xspline)))

    for i = 1:nrep
        yder2 = spline(x, path)
        splint!(yspline, x, path, yder2, xspline)
        draw_pixel!(img, yspline[1, :], yspline[2, :])
        update_path!(path, scale_value = scale_value, periodic = periodic)
    end

end
