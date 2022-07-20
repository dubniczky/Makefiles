# Python Makefile

A Makefile for python environments using venv and a requirements file to track dependencies.

> Don't forget to customize settings parameters and scripts for your specific project.

## Commands

|Command|Effect|
|---|---|
|`make`, `make run`|Runs the main entry point. Creates venv if does not exist, installs dependencies if changed|
|`make install`|Installs dependencies and creates a lock file|
|`make lock`|Creates a lock file from currently installed package versions|
|`make clean`|Deletes the virtual environment and python cache folders|
|`make venv`|Creates a new virtual environment|
|`make generate`|Creates a basic project to run with a main file, empty pacakge list and venv|
|`make deploy`|Cleans up, install packages globally from lock, and compiles project to pyc files|
|`make up`|Runs the application in production mode without virtual environment from pyc files|
|`make lint`|Runs specified linter|
|`make test`|Runs specified tester|

## Settings

|Name|Default|Description|
|---|---|---|
|`venv_name`|`.venv`|Name of the virtual environment folder|
|`deps_name`|`requirements.txt`|Name of the package dependency list|
|`lock_name`|`pip.lock`|Name of the package dependency lock list|
|`lint_lib`|`pylint`|Name of the linter library|
|`test_lib`|`pytest`|Name of the tester library|
|`pybin`|`python3`|Name of the python binary to call|
|`main`|`main.py`|Name of the entry point of the application|
|`params`||Parameters to pass to the main entry on run|
|`deploy_params`||Parameters to pass to the main entry on deployment run|
|`caches`|`__pycache__/`|Space separated list of folders and files to remove on clean command|
