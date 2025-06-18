# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause
"""Integration of a cubic spline."""

import numpy as np
from numpy.typing import NDArray


def splint(
    xs: NDArray[np.floating],
    ys: NDArray[np.floating],
    y2s: NDArray[np.floating],
    x: NDArray[np.floating],
    y: NDArray[np.floating],
) -> None:
    """
    Evaluate a sample on a cubic spline.

    Parameters
    ----------
    xs
        The x coordinates of the cubic spline.
    ys
        The y coordinates of the cubic spline.
    y2s
        The second derivative of the cubic spline.
    x
        The sample where to evaluation the cubic spline.
    y
        The y coordinates of the sample.

    See Also
    --------
    splinart.spline.spline

    """
    khi = np.searchsorted(xs, x)
    klo = khi - 1
    step = xs[khi] - xs[klo]
    x_right = (xs[khi] - x) / step
    x_left = (x - xs[klo]) / step

    if y.ndim == 2:
        step = step[:, np.newaxis]
        x_right = x_right[:, np.newaxis]
        x_left = x_left[:, np.newaxis]

    y[:] = (
        x_right * ys[klo]
        + x_left * ys[khi]
        + ((x_right**3 - x_right) * y2s[klo] + (x_left**3 - x_left) * y2s[khi])
        * step**2
        / 6
    )
