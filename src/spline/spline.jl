# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause
#

export spline

"""
$(SIGNATURES)

Return the second derivative of a cubic spline.

Parameters
----------

- `xs` : The x coordinate of the cubic spline.
- `ys` : The y coordinate of the cubic spline.

Returns
-------
- The second derivative of the cubic spline.

"""
function spline(xs, ys::AbstractVector)

    n = size(xs, 1)
    u_i = zero(ys)
    y2s = zero(ys)

    for i = 2:n-1
        u_i[i] =
            (ys[i+1] - ys[i]) / (xs[i+1] - xs[i]) - (ys[i] - ys[i-1]) / (xs[i] - xs[i-1])
    end

    for i = 2:n-1
        sig = (xs[i] - xs[i-1]) / (xs[i+1] - xs[i-1])
        p_i = sig * y2s[i-1] + 2.0
        y2s[i] = (sig - 1) / p_i
        u_i[i] = (6 * u_i[i] / (xs[i+1] - xs[i-1]) - sig * u_i[i-1]) / p_i
    end

    for i = n-1:-1:1
        y2s[i] = y2s[i] * y2s[i+1] + u_i[i]
    end

    return y2s
end

function spline(xs, ys::AbstractMatrix)

    n = size(xs, 1)
    u_i = zero(ys)
    y2s = zero(ys)

    for i = 2:n-1, j in axes(ys, 1)
        u_i[j, i] =
            (ys[j, i+1] - ys[j, i]) / (xs[i+1] - xs[i]) -
            (ys[j, i] - ys[j, i-1]) / (xs[i] - xs[i-1])
    end

    for i = 2:n-1
        sig = (xs[i] - xs[i-1]) / (xs[i+1] - xs[i-1])
        for j in axes(y2s, 1)
            p_i = sig * y2s[j, i-1] + 2.0
            y2s[j, i] = (sig - 1) / p_i
            u_i[j, i] = (6 * u_i[j, i] / (xs[i+1] - xs[i-1]) - sig * u_i[j, i-1]) / p_i
        end
    end

    for i = n-1:-1:1, j in axes(y2s, 1)
        y2s[j, i] = y2s[j, i] * y2s[j, i+1] + u_i[j, i]
    end

    return y2s
end
