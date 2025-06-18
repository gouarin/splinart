 |binder| |RTD| |conda| |codecov|

splinart is a package used for a tutorial which explains how to do the Python packaging using

- `PyPi <https://pypi.python.org/pypi>`_
- `conda build <https://conda.io/docs/user-guide/tasks/build-packages/recipe.html>`_
- `pytest <https://docs.pytest.org/en/latest/>`_
- `ruff <https://docs.astral.sh/ruff/>`_
- `Sphinx <http://www.sphinx-doc.org/en/stable/>`_
- `uv <https://docs.astral.sh/uv/>`_

And automate the process to distribute this package using github.

The original idea of splinart is found on the great `invonvergent <http://inconvergent.net/>`_ website.

.. image:: https://github.com/gouarin/splinart/blob/main/examples/output/circles.png
.. image:: https://github.com/gouarin/splinart/blob/main/examples/output/lines.png

Installation
============

If you want to install splinart using pip::

    pip install --extra-index-url https://testpypi.python.org/pypi splinart

or using conda::

    conda install -c gouarin splinart

or using uv::

    uv add --extra-index-url https://testpypi.python.org/pypi splinart

Development
===========

For development, you can use uv to manage dependencies::

    # Clone the repository
    git clone https://github.com/gouarin/splinart.git
    cd splinart

    # Install dependencies and development tools
    uv sync --extra dev

    # Activate the virtual environment
    source .venv/bin/activate  # or .venv\Scripts\activate on Windows

.. |binder| image:: https://mybinder.org/badge.svg
   :target: https://mybinder.org/v2/gh/gouarin/splinart/main

.. |conda| image:: https://anaconda.org/gouarin/splinart/badges/version.svg
   :target: https://anaconda.org/gouarin/splinart

.. |codecov| image:: https://codecov.io/gh/gouarin/splinart/branch/main/graph/badge.svg
   :target: https://codecov.io/gh/gouarin/splinart

.. |RTD| image:: https://readthedocs.org/projects/splinart/badge/?version=latest
   :target: http://splinart.readthedocs.io/
