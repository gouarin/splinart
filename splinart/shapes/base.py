# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause
"""Define basic shapes."""

from typing import List, Tuple, Union
import numpy as np
from numpy.typing import NDArray


def circle(
    center: Union[List[float], Tuple[float, float], NDArray[np.floating]],
    radius: float,
    npoints: int = 50,
) -> Tuple[NDArray[np.floating], NDArray[np.floating]]:
    """
    Discretization of a circle.

    Parameters
    ----------
    center : list(2)
        2d coordinates of the center.
    radius : float
        Radius of the circle.
    npoints : int
        Number of discretization points (the default value is 50).

    Returns
    -------
    np.ndarray
        The theta angle.
    np.ndarray
        The 2d coordinates of the circle.

    """
    theta = 2 * np.pi * np.linspace(0, 1, npoints)
    path = np.c_[center[0] + radius * np.cos(theta), center[1] + radius * np.sin(theta)]
    return theta, path


def line(
    begin: float,
    end: float,
    ypos: float = 0.5,
    npoints: int = 50,
) -> NDArray[np.floating]:
    """
    Discretization of a horizontal line.

    Parameters
    ----------
    begin : float
        The left point of the line.

    end : float
        The right point of the line.

    ypos : float
        The position of the y coordinate (the default value is 0.5).

    npoints : int
        Number of discretization points (the default value is 50).

    Returns
    -------
    np.ndarray
        The 2d coordinates of the line.

    """
    x = np.linspace(begin, end, npoints)
    y = ypos * np.ones(npoints)
    return np.c_[x, y]
