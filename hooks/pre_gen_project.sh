#!/bin/sh

# Insert empty line after the cookiecutter prompts
echo

# Check that pyenv and poetry are installed.
# git clone repo according to PYENV_ROOT
[ -z $(command -v pyenv) ] && echo "'pyenv' is not installed" && exit -1
# pip install poetry
[ -z $(command -v poetry) ] && echo "'poetry' is not installed" && exit -1

# Check that the given Python version is installed.
[ -z "$(pyenv versions | grep {{cookiecutter.python_version}})" ] \
    && echo "Python{{cookiecutter.python_version}} is not installed" \
    && exit -1

echo "Everything is good to go! Setting up Python project..."
echo
