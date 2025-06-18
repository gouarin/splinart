"""Example of drawing circles with splinart."""

import numpy as np
import splinart as spl

img_size, channels = 1000, 4
img = np.ones((img_size, img_size, channels), dtype=np.float32)

nb_circles = 10
theta_circles = []
path_circles = []
color_circles = []

for i in range(nb_circles):
    radius = 0.1 + np.random.random() * 0.1
    center = 0.2 + np.random.random(2) * 0.6
    theta, path = spl.circle(center, radius, npoints=75)
    theta_circles.append(theta)
    path_circles.append(path)
    color = np.random.random(4) * 0.6
    color[-1] = 1.0
    color_circles.append(color)


def xs_func():
    """Return a random path on the circle."""
    nsamples = 500
    return (np.random.random() + 2 * np.pi * np.linspace(0, 1, nsamples)) % (2 * np.pi)


for i in range(nb_circles):
    spl.update_img(
        img,
        path_circles[i],
        xs_func,
        nrep=1000,
        scale_value=0.00005,
        x=theta_circles[i],
        color=color_circles[i],
    )

spl.save_img(img, "./output", "circles.png")
