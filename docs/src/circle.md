# Splinart on a circle

In this tutorial, we will see how to use splinart with a circle.

First of all, we have to create a circle.

```@example circle
using Splinart

center = [.5, .5]
radius = .3
theta, path = circle(center, radius)
```

In the previous code, we create a discretization of a circle centered in $[0.5, 0.5]$ with a radius of $0.3$. We don't specify the number of discretization points. The default is 30 points.

We can plot the points using matplotlib.

```@example circle
import Plots

Plots.scatter(path[1, :], path[2, :], aspect_ratio = 1)
```

## The sample

In order to compute a sample on a given cubic spline equation, we need to provide a Python function that gives us the x coordinates. We can choose for example.

```@example circle
using Random

function x_func()
    nsamples = 500
    return mod2pi.(rand() .+ 2pi .* LinRange(0, 1, nsamples))
end
```

We can see that the points are chosen between $[0, 2\pi]$ in a random fashion.


## The cubic spline

Given a path, we can apply the spline function in order to compute the second derivative of this cubic spline.

```@example circle
yder2 = spline(theta, path)
```

And apply the equation to the sample

```@example circle
xsample = x_func()
ysample = zeros(2, length(xsample))
splint!(ysample, theta, path, yder2, xsample)
```

which gives

```@example circle
Plots.scatter(ysample[1, :], ysample[2, :], aspect_ratio=1)
```

We can see the sample is well defined around the circle that we defined previously.

Now, assume that we move randomly the points of the circle with a small distance.

```@example circle
update_path!(path, scale_value=.001, periodic=true)
```

```@example circle
Plots.scatter(path[1, :], path[2, :], aspect_ratio=1)
```

And we compute again the sample of the new cubic spline equation.

```@example circle
yder2 = spline(theta, path)
splint!(ysample, theta, path, yder2, xsample)
```

```@example circle
Plots.scatter(ysample[1, :], ysample[2, :], ms = 2, aspect_ratio=1)
```

```@example circle
update_path!(path, scale_value=.001, periodic=true)
yder2 = spline(theta, path)
splint!(ysample, theta, path, yder2, xsample)
Plots.scatter!(ysample[1, :], ysample[2, :], ms = 2, aspect_ratio=1)
```

The circle is deformed.

This is exactly how works splinart. We give a shape and at each step

- we perturb the points of this shape
- we compute a sample an this new cubic spline equation
- we add the pixel with a given color on the output image

And we do that several time. We can have the following result


```@example circle
img_size = 1000
img = ones(Int, (img_size, img_size))

theta, path = circle([0.5, 0.5], 0.3)

function xs_func()
    nsamples = 500
    return mod2pi.(rand() .+ (2π .* LinRange(0, 1, nsamples)))
end

update_img!(img, path, xs_func, theta, nrep=4000)

Plots.heatmap(img, c = Plots.cgrad(:grays, rev=true), aspect_ratio=1, legend = false, showaxis = false)
```
