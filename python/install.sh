if ! command -v pyenv 1>/dev/null 2>&1
then
    echo "pyenv could not be found"
else 
    # Install python 3.11 using pyenv, in case it's not already installed
    eval "$(pyenv init -)"
    PYTHON_VERSION=3.12

    if ! pyenv versions | grep -q $PYTHON_VERSION; then
        echo "Installing python $PYTHON_VERSION using pyenv"
        pyenv install $PYTHON_VERSION 1>/dev/null 2>&1
        pyenv global $PYTHON_VERSION 1>/dev/null 2>&1
    fi    
fi

# https://python-poetry.org/docs/managing-environments/
if command -v poetry 1>/dev/null 2>&1
then
    poetry config virtualenvs.prefer-active-python true
fi

