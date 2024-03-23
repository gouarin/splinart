# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause
#

export splint!

"""
$(SIGNATURES)

Evaluate a sample on a cubic pline.

Parameters
----------
- `xs` : The x coordinates of the cubic spline.
- `ys` : The y coordinates of the cubic spline.
- `y2s` : The second derivative of the cubic spline.
- `x` : The sample where to evaluation the cubic spline.
- `y` : The y coordinates of the sample.

See Also
--------
[`Splinart.spline`](@ref)

"""
function splint!(y, xs, ys, y2s, x)

    n = length(xs)

    for i in eachindex(x)

        khi = searchsortedfirst(xs, x[i])
        klo = mod1(khi - 1, n)
        step = xs[khi] - xs[klo]
        x_right = (xs[khi] - x[i]) / step
        x_left = (x[i] - xs[klo]) / step

        for j in axes(y, 1)
            y[j, i] = (
                x_right * ys[j, klo] +
                x_left * ys[j, khi] +
                ((x_right^3 - x_right) * y2s[j, klo] + (x_left^3 - x_left) * y2s[j, khi]) * step^2 ./ 6
            )
        end

    end
end
