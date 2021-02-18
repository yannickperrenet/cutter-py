#!/bin/sh

# Setup git repository
git init

# Specifically tell poetry to use the indicated Python version.
PYTHON_EXECUTABLE="$(pyenv prefix {{cookiecutter.python_version}})"
poetry env use "$PYTHON_EXECUTABLE/bin/python"

# Install dev dependencies
poetry install

{% if cookiecutter.pre_commit == 'y' %}
# Setup pre-commit
poetry run pre-commit install
{% endif %}
