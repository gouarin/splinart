"""Example of drawing a circle with splinart."""

import numpy as np
import splinart as spl

np.random.seed(42)
img_size, channels = 1000, 4
img = np.ones((img_size, img_size, channels), dtype=np.float32)

theta, path = spl.circle([0.5, 0.5], 0.3, npoints=40)


def xs_func():
    """Return a random path on the circle."""
    nsamples = 500
    return (np.random.random() + 2 * np.pi * np.linspace(0, 1, nsamples)) % (2 * np.pi)


spl.update_img(img, path, xs_func, nrep=4000, x=theta, scale_value=0.00005)

spl.save_img(img, "./output", "circle.png")
