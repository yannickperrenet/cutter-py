# Python Cookiecutter

## Prerequisites
* pyenv
* poetry

## Structure
Creates virtual environment in `.venv` so that `pyright` knows where to find it.

Configuration adheres to the Python version specified when setting up the project. Using multiple
Python versions is not supported for the same project.

## WIP

```bash
poetry run pre-commit install
```

```bash
# https://python-poetry.org/docs/managing-environments/
pyenv install 2.7.15
pyenv local 2.7.15  # Activate Python 2.7 for the current project
poetry install

# Probably also works doing the following to use multiple Python
# versions. Then you have to specify "path" option in "poetry.toml"
pyenv shell 3.6.0
poetry install
poetry env use 3.6
```

TODO:
* Check that the specified Python version is indeed installed on the system. Or use the special
  'system' string to set the local pyenv. The `tool.poetry.dependencies` jinja then has to be
  removed if 'system' is given.
    * Then also pyrgith has to be updated
* Trigger `poetry install` in a `post_gen_project.sh`
    * https://cookiecutter.readthedocs.io/en/1.7.2/advanced/hooks.html
    * https://github.com/audreyfeldroy/cookiecutter-pypackage
