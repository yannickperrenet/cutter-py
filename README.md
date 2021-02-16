# Python Cookiecutter

## Prerequisites
* `pyenv`
* `poetry`
* (Optional) `pyright`

## Structure
Creates virtual environment in `.venv` so that `pyright` can be configured to find it.

Configuration adheres to the Python version specified when setting up the project.

`pyenv` is only used to install additional Python versions. The Python executables are then pointed
to by `poetry` using `poetry env use <path-to-python-executable>`.

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

Installation of a specific Python version (using pyenv):
```bash
# Check the available versions
pyenv install -l

# Install a version
pyenv install 3.9.0
```

`pre-commit` blocks `git commit` due to `Executable ... not found`:
```bash
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
