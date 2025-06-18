# Development Guide

This project uses [uv](https://docs.astral.sh/uv/) for dependency management and Python environment management.

## Setup

1. Install uv:
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. Clone the repository:
   ```bash
   git clone https://github.com/gouarin/splinart.git
   cd splinart
   ```

3. Install dependencies:
   ```bash
   # Install main dependencies
   uv sync

   # Install with development dependencies
   uv sync --extra dev
   ```

## Common Commands

### Running Tests
```bash
# Run all tests
uv run pytest

# Run tests with coverage
uv run pytest --cov=splinart

# Run tests with coverage and generate HTML report
uv run pytest --cov=splinart --cov-report=html
```

### Code Quality
```bash
# Run ruff linter
uv run ruff check .

# Run ruff formatter
uv run ruff format .

# Fix linting issues automatically
uv run ruff check --fix .

# Run type checking with mypy
uv run mypy splinart/

# Run all quality checks
uv run ruff check . && uv run mypy splinart/
```

### Installing New Dependencies
```bash
# Add a new runtime dependency
uv add numpy

# Add a new development dependency
uv add --dev pytest-xdist

# Remove a dependency
uv remove package-name
```

### Running the CLI
```bash
# Run the splinart CLI
uv run splinart --help
```

### Building the Package
```bash
# Build the package
uv build

# Install in editable mode
uv pip install -e .
```

## Virtual Environment

uv automatically creates and manages a virtual environment in `.venv/`. To activate it manually:

```bash
# On Unix/macOS
source .venv/bin/activate

# On Windows
.venv\Scripts\activate
```

You can also run commands directly with `uv run` without activating the environment.

## Migration from requirements.txt

This project previously used `requirements.txt` for dependency management. With the introduction of uv, all dependencies are now managed through `pyproject.toml`:

- **Runtime dependencies**: Listed in `dependencies = [...]`
- **Development dependencies**: Listed in `project.optional-dependencies.dev = [...]`
- **Lock file**: `uv.lock` ensures reproducible installations

The old `requirements.txt` file is kept for backward compatibility but is no longer actively maintained. For new development, use uv commands instead:

```bash
# Old way
pip install -r requirements.txt

# New way
uv sync --extra dev
```
