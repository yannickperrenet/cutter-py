# Python Cookiecutter

## Prerequisites
* [`pyenv`](https://github.com/pyenv/pyenv): Python installation manager.
* [`poetry`](https://github.com/python-poetry/poetry): Python dependency (and packaging) manager.
* (Optional) [`pyright`](https://github.com/microsoft/pyright): Python language server (and static
  type checker).

## Structure
Configuration adheres to the Python version specified when setting up the project.

Resulting project structure:
```bash
.
├── <project_name>
│   └── __init__.py
├── .gitignore
├── poetry.toml
├── .pre-commit-config.yaml
├── .venv
│   └── ...
├── pyproject.toml
├── pyrightconfig.json
└── README.md
```

> This configuration sets up automatic code formatting with [`black`](https://github.com/psf/black)
> using [`pre-commit`](https://github.com/pre-commit/pre-commit).

### `poetry` and `pyright`
`poetry` is configured in `poetry.toml` such that it creates the virtual environment in the `.venv`
directory. This way `pyright` can configure the language server to use that virtual environment
(using `pyrightconfig.json`).

### `poetry` and `pyenv`
`pyenv` is only used to manage Python installation, i.e. install different Python versions. The
Python executables (of a specific Python version) are then pointed to by `poetry` using
`poetry env use <path-to-python-executable>`. This way the virtual environment managed by `poetry`
makes use of a specific Python version.

## Troubleshooting
Installation of poetry:
```bash
pip install poetry
```

Installation of pyenv:
```bash
# Clone into /opt/pyenv

# Set `PYENV_ROOT` in your profile to point to the installation.
# PYENV_ROOT=/opt/pyenv

# Symlink the `pyenv` executable in `~/.local/bin` so you don't have to
# alter your `$PATH` (under the assumption that `~/.local/bin` already
# is).
```

Installation of pyright:
```bash
# `sudo` is needed to run with the global `-g` flag, as we want the
# language server to be installed globally and not per project.
sudo npm install -g pyright
```

Installation of a specific Python version (using pyenv):
```bash
# Check the available versions
pyenv install -l

# Install a version
pyenv install 3.9.0
```

`pre-commit` blocks `git commit` due to `Executable ... not found`:
```bash
# This issue should only occur if you specify `local` as the `repo` in
# `.pre-commit-config.yaml` and add the package to `pyproject.toml`.

# Make sure to activate the virtual environment. Otherwise pre-commit
# will try to use the executable of the installed Python version,
# instead of the one installed in the environment.
poetry shell

# And now proceed with your git command
git commit -m "Initial commit"
```

The right Python version is not used:
```bash
# Example environment switch to the installed Python3.6
poetry env use 3.6

# Point to a Python executable using pyenv.
poetry env use $PYENV_ROOT/versions/3.6.0/bin/python

# Or use `pyenv prefix 3.6.0` to get the path to the version directory.
```
> Note that using this same principle you can manage multiple Python versions.

## WIP
TODO:
* Add pyenv and poetry to iscripts (and remove virtualenv)
* Add alias or script for `cookiecutter gh:yannickperrenet/cutter-` so it can be called like
  `cutter py`
* Make cookiecutter adhere to XDG
    * https://cookiecutter.readthedocs.io/en/1.7.2/advanced/user_config.html
    * Set `$COOKIECUTTER_CONFIG` and in the config file set the `cookiecutters_dir` and `replay_dir`
