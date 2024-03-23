# Splinart.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://pnavaro.github.io/Splinart.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://pnavaro.github.io/Splinart.jl/dev)
[![GitHub Actions](https://github.com/pnavaro/Splinart.jl/workflows/Run%20tests/badge.svg)](https://github.com/pnavaro/Splinart.jl/actions?query=workflow%3ARun+tests)
[![Codecov](https://codecov.io/gh/pnavaro/Splinart.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaTesting/Splinart.jl)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)


Julia package used for a tutorial which explains how to do the Julia packaging and automate the process to distribute this package using github.

This is a translation in Julia language of the Python package [splinart](https://github.com/gouarin/splinart/).

A [C++](https://github.com/gouarin/splinart-cpp) version is also available. It uses software manager [pixi](https://prefix.dev) for deployment.

The original idea of splinart is found on the great [invonvergent](https://inconvergent.net) website.

If you want to install Splinart::

```julia
import Pkg
Pkg.add("https://github.com/pnavaro/Splinart.jl")
```
