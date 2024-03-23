# Author:
#     Loic Gouarin <loic.gouarin@gmail.com>
#
# License: BSD 3 clause

import Plots


"""
$(SIGNATURES)

Add pixels on the image.

Parameters
----------
- `img` : The image where we add pixels.
- `xs` : The x coordinate of the pixels to add.
- `ys` : The y coordinate of the pixels to add.

"""
function draw_pixel!(img, xs, ys)

    img_size = size(img, 1)
    for (x, y) in zip(xs, ys)
        i = ceil(Int, x * img_size)
        j = ceil(Int, y * img_size)
        if 0 < i <= img_size && 0 < j <= img_size
            img[i, j] += 1
        end
    end
end

export save_img

"""
$(SIGNATURES)

Save the image in a png file.

Parameters
----------
- `img` : The image to save.
- `path` : The save directory.
- `filename` : The file name with the png extension.

"""
function save_img(img, path, filename)

    Plots.heatmap(
        img,
        c = Plots.cgrad(:grays, rev = true),
        aspect_ratio = 1,
        legend = false,
        showaxis = false,
    )

    !isdir(path) && mkpath(path)

    Plots.savefig(joinpath(path, filename))

end

export show_img

"""
$(SIGNATURES)

Plot the image using matplotlib.

Parameters
----------
- `img` : The image to save.

"""
function show_img(img)
    p = Plots.heatmap(
        img,
        c = Plots.cgrad(:grays, rev = true),
        aspect_ratio = 1,
        legend = false,
        showaxis = false,
    )
    Plots.display(p)
end
